import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:geolocator/geolocator.dart';

class UploadIncident {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  final Uuid _uuid = Uuid();

  /// Requests storage permission and returns `true` if granted.
  Future<bool> _requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.request();
    return status.isGranted;
  }

  /// Crops an image and returns the file path.
  Future<String?> _cropImage(String imagePath) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 85,
      );
      return croppedFile?.path;
    } catch (e) {
      print("Error cropping image: $e");
      return null;
    }
  }

  /// Picks and crops up to 4 images from the gallery.
  Future<List<File>> pickAndCropImages() async {
    List<File> imageFiles = [];

    if (await _requestStoragePermission()) {
      final pickedFiles = await _picker.pickMultiImage(imageQuality: 85);

      if (pickedFiles != null) {
        for (var file in pickedFiles.take(4)) {
          String? croppedPath = await _cropImage(file.path);
          if (croppedPath != null) {
            imageFiles.add(File(croppedPath));
          }
        }
      }
    } else {
      print("Storage permission denied.");
    }

    return imageFiles;
  }

  /// Uploads images to Firebase Storage and returns their download URLs.
  Future<List<String>> _uploadImages(List<File> images, String incidentId) async {
    List<String> imageUrls = [];

    for (var image in images) {
      try {
        final ref = _storage.ref().child('incident_images/$incidentId/${_uuid.v4()}.jpg');
        await ref.putFile(image);
        String downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      } catch (e) {
        print("Error uploading image: $e");
      }
    }

    return imageUrls;
  }

  /// Gets the current location as a string.
  Future<String?> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("Location permission denied.");
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print("Location permissions are permanently denied.");
        return null;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      return "${position.latitude}, ${position.longitude}";
    } catch (e) {
      print("Error getting location: $e");
      return null;
    }
  }

  /// Uploads an incident to Firebase Firestore.
  Future<void> uploadIncident({
    required String headline,
    required String description,
    required String type,
    required List<File> images,
  }) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        print("Error: User is not authenticated.");
        return;
      }

      String? location = await getCurrentLocation();
      if (location == null) {
        print("Error: Unable to get location.");
        return;
      }

      String incidentId = _uuid.v4();
      List<String> imageUrls = await _uploadImages(images, incidentId);

      Map<String, dynamic> incidentData = {
        "incidentId": incidentId,
        "headline": headline,
        "description": description,
        "type": type,
        "location": location,
        "images": imageUrls,
        "timestamp": FieldValue.serverTimestamp(),
        "userId": user.uid,
      };

      await _firestore.collection("Incidents").doc(incidentId).set(incidentData);

      String targetCollection = await _getUserCollection(user.uid);

      await _firestore
          .collection(targetCollection)
          .doc(user.uid)
          .collection("Incidents")
          .doc(incidentId)
          .set(incidentData);

      print("Incident successfully uploaded.");
    } catch (e) {
      print("Error uploading incident: $e");
    }
  }

  Future<String> _getUserCollection(String uid) async {
    DocumentSnapshot orgDoc = await _firestore.collection("Organizations").doc(uid).get();
    if (orgDoc.exists) {
      return "Organizations";
    }
    return "Users";
  }
}
