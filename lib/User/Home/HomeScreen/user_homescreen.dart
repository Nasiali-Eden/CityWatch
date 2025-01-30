import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Set the height of the AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple[700],
            boxShadow: [
              BoxShadow(
                color: Colors.white.withAlpha(
                    (0.05 * 255).toInt()), // Shadow color with opacity
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
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 0.90 * deviceWidth,
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromRGBO(182, 182, 182, 1.0),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.add,
                      color: Colors.teal,
                    ),
                    onTap: () {},
                  ),
                  Text(
                    'Report Incident',
                    style: TextStyle(color: Colors.teal),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.deepPurple, // Line color
              thickness: 4.0, // Line thickness
              height: 15.0, // Space above and below the line
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Top Updates',
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
