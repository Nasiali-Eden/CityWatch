import 'package:city_watch/Organization/Home/Dashboard/org_dashboard.dart';
import 'package:city_watch/Organization/Home/OurTeam/org_team.dart';
import 'package:city_watch/Organization/Home/Profile/org_profile.dart';
import 'package:city_watch/Organization/Home/Volunteers/org_volunteers.dart';
import 'package:city_watch/User/Home/Reports/user_reports.dart';
import 'package:flutter/material.dart';

class OrganizationHome extends StatefulWidget {
  const OrganizationHome({super.key});

  @override
  State<OrganizationHome> createState() => _OrganizationHomeState();
}

class _OrganizationHomeState extends State<OrganizationHome> {
  int currentPage = 0;

  final List<Widget> pages = [
    const OrgDashboard(),
    const UserReports(),
    const OrgTeam(),
    const OrgVolunteers(),
    const OrgProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentPage], // Display the current page
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurpleAccent.withAlpha((0.05 * 255).toInt()), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 10, // Blur radius
              offset: const Offset(0, -2), // Shadow position
            ),
          ],
        ),
        child: BottomAppBar(
          elevation: 0, // Set elevation to 0 since we're using a custom shadow
          color: Colors.white, // Background color of the BottomAppBar
          height: 85.0,
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Evenly distribute icons
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.apps,
                      color: currentPage == 0
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                    iconSize: 25.0,
                    onPressed: () {
                      setState(() {
                        currentPage = 0;
                      });
                    },
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: currentPage == 0
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.bolt_outlined,
                      color: currentPage == 1
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                    iconSize: 25.0,
                    onPressed: () {
                      setState(() {
                        currentPage = 1;
                      });
                    },
                  ),
                  Text(
                    'Incidents',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: currentPage == 1
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.people,
                      color: currentPage == 2
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                    iconSize: 25.0,
                    onPressed: () {
                      setState(() {
                        currentPage = 2;
                      });
                    },
                  ),
                  Text(
                    'Our Team',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: currentPage == 2
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.construction,
                      color: currentPage == 3
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                    iconSize: 25.0,
                    onPressed: () {
                      setState(() {
                        currentPage = 3;
                      });
                    },
                  ),
                  Text(
                    'Volunteers',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: currentPage == 3
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.person_2_outlined,
                      color: currentPage == 4
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                    iconSize: 25.0,
                    onPressed: () {
                      setState(() {
                        currentPage = 4;
                      });
                    },
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: currentPage == 4
                          ? const Color.fromRGBO(124, 77, 255, 1.0)
                          : const Color.fromRGBO(40, 40, 40, 1),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}