import 'package:flutter/material.dart';

class OrgVolunteers extends StatefulWidget {
  const OrgVolunteers({super.key});

  @override
  State<OrgVolunteers> createState() => _OrgVolunteersState();
}

class _OrgVolunteersState extends State<OrgVolunteers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Set the height of the AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurpleAccent.withAlpha((0.05 * 255).toInt()), // Shadow color with opacity
                blurRadius: 4.0, // Adjust the blur radius
                offset: Offset(0, 3), // Position of the shadow
              ),
            ],
          ),
          child: AppBar(
            backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
            elevation: 0, // Remove default shadow
            title: Text(
              'Volunteers',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('Volunteers'),
      ),
    );
  }
}
