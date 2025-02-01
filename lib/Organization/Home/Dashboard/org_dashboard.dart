import 'package:flutter/material.dart';

import '../../../Shared/Inputs/post_incident.dart';
import '../post_article.dart';

class OrgDashboard extends StatefulWidget {
  const OrgDashboard({super.key});

  @override
  State<OrgDashboard> createState() => _OrgDashboardState();
}

class _OrgDashboardState extends State<OrgDashboard> {
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
                color: Colors.white.withAlpha((0.05 * 255).toInt()), // Shadow color with opacity
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
              'Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(0.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 0.40 * deviceWidth,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
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
                          color: Colors.teal,
                        ),
                        Text(
                          'Report Incident',
                          style: TextStyle(color: Colors.teal),
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
                Container(
                  margin: EdgeInsets.all(10),
                  width: 0.40 * deviceWidth,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
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
                          color: Colors.teal,
                        ),
                        Text(
                          'Create Article',
                          style: TextStyle(color: Colors.teal),
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PostArticle()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
