import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> postDetailsToFirestore(String uid, String email, String role, Map<String, dynamic> additionalData) async {
    Map<String, dynamic> userData = {
      'email': email,
      'role': role,
      'firstName': additionalData['firstName'],
    };

    if (role == 'buyer') {
      userData['dob'] = additionalData['dob'];
      userData['gender'] = additionalData['gender'];
    } else if (role == 'vendor') {
      userData['lastName'] = additionalData['lastName'];
      userData['idNo'] = additionalData['idNo'];
      userData['shopName'] = additionalData['shopName'];
      userData['products'] = additionalData['products'];
      userData['county'] = additionalData['county'];
      userData['constituency'] = additionalData['constituency'];
      userData['street'] = additionalData['street'];
      userData['description'] = additionalData['description'];
    }
    
    String collection = role == 'vendor' ? 'vendors' : 'buyers';
    await _firebaseFirestore.collection(collection).doc(uid).set(userData);
  }
}

