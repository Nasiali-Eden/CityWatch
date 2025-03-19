import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserReports extends StatefulWidget {
  const UserReports({super.key});

  @override
  State<UserReports> createState() => _UserReportsState();
}

class _UserReportsState extends State<UserReports> {
  GoogleMapController? _controller;
  bool _showDrawer = false;

  // Define Kirinyaga County bounding box
  final LatLngBounds kirinyagaBounds = LatLngBounds(
    southwest: LatLng(-0.814, 37.073), // SW Corner
    northeast: LatLng(-0.373, 37.525), // NE Corner
  );

  void _toggleDrawer() {
    setState(() {
      _showDrawer = !_showDrawer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurpleAccent.withAlpha(
                    (0.05 * 255).toInt()),
                blurRadius: 4.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Incidents',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            actions: [
              if (!_showDrawer)
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.deepPurpleAccent),
                  onPressed: _toggleDrawer,
                ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          if (_showDrawer) {
            setState(() {
              _showDrawer = false;
            });
          }
        },
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(-0.6, 37.3), // Center of Kirinyaga
                zoom: 12,
              ),
              cameraTargetBounds: CameraTargetBounds(kirinyagaBounds),
              minMaxZoomPreference: const MinMaxZoomPreference(10, 16),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),

            // Drawer Animation
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: _showDrawer ? 0 : -MediaQuery.of(context).size.width * 0.78,
              top: 0,
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.78,
                height: MediaQuery.of(context).size.height,
                child: Material(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.deepPurpleAccent),
                          onPressed: _toggleDrawer,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 20, // Example items
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("Item $index"),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}