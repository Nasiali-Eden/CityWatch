import 'package:flutter/material.dart';

import '../Reusables/footer/logo.dart';
import '../Shared/login.dart';



class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      body: Stack(
        children: [

          Positioned(
            bottom: 85, // Position the text and Sign In link
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already Have an Account?',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FooterLogo(), // Add your Footer widget here
          ),
        ],
      ),
    );
  }
}
