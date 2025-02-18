import 'package:citywatch/Shared/Inputs/post_incident.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  Color maroon = Color(0xFFD52020);
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Set the height of the AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurpleAccent.withAlpha(
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
                color: Colors.deepPurpleAccent,
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
                color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromRGBO(182, 182, 182, 1.0),
                  )),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      'Report Incident',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PostIncident()),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.deepPurple, // Line color
              thickness: 3.0, // Line thickness
              height: 15.0, // Space above and below the line
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Top Updates',
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
