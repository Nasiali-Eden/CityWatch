import 'package:flutter/material.dart';

class FooterLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'pngs/white_icon.png', // Ensure this path is correct
        width: 35, // Adjust size as needed
        height: 35,
      ),
    );
  }
}

class FooterLogoTeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/logo.png', // Ensure this path is correct
        width: 35, // Adjust size as needed
        height: 35,
      ),
    );
  }
}

