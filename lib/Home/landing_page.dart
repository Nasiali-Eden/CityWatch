import 'package:flutter/material.dart';
import '../Reusables/footer/logo.dart';
import '../Shared/login.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Positioned text at the top
          Positioned(
            top: 150, // Distance from the top of the screen
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Welcome to CityWatch',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,

                ),
              ),
            ),
          ),
          // Center section with containers
          Center(
            child: SizedBox(
              width: 0.90 * deviceWidth, // 90% of the device width
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Container for Normal User
                  _buildSquareContainer(
                    icon: Icons.person,
                    label: 'Normal User',
                    color: Colors.blue.shade100,
                  ),
                  const SizedBox(width: 8), // Add horizontal space
                  // Container for Organisation
                  _buildSquareContainer(
                    icon: Icons.business,
                    label: 'Organisation',
                    color: Colors.green.shade100,
                  ),
                ],
              ),
            ),
          ),
          // Sign-in link
          Positioned(
            bottom: 85, // Position the text and Sign In link
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already Have an Account?',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Footer logo at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: FooterLogo(), // Add your Footer widget here
          ),
        ],
      ),
    );
  }

  Widget _buildSquareContainer({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1, // Makes the container a square
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.black87,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
