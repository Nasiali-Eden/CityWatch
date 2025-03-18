import 'package:city_watch/Shared/Pages/login.dart';
import 'package:flutter/material.dart';
import '../components/square_tile.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Or Continue With',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareTile(imagePath: 'images/google.png'),
            SizedBox(width: 10),
            SquareTile(imagePath: 'images/apple.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already Have an Account?',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              child: const Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
