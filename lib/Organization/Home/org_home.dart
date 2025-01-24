
import 'package:citywatch/Organization/Home/Dashboard/org_dashboard.dart';
import 'package:citywatch/Organization/Home/Incidents/org_incidents.dart';
import 'package:citywatch/Organization/Home/OurTeam/org_team.dart';
import 'package:citywatch/Organization/Home/Profile/org_profile.dart';
import 'package:citywatch/Organization/Home/Volunteers/org_volunteers.dart';
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
    const OrgIncidents(),
    const OrgTeam(),
    const OrgVolunteers(),
    const OrgProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentPage], // Display the current page
      bottomNavigationBar: BottomAppBar(
        elevation: 100.0,
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
                    Icons.auto_awesome_mosaic_outlined,
                    color: currentPage == 0
                        ? const Color.fromRGBO(0, 161, 154, 1)
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
                        ? const Color.fromRGBO(0, 161, 154, 1)
                        : const Color.fromRGBO(40, 40, 40, 1),
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.explore_outlined,
                    color: currentPage == 1
                        ? const Color.fromRGBO(0, 161, 154, 1)
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
                        ? const Color.fromRGBO(0, 161, 154, 1)
                        : const Color.fromRGBO(40, 40, 40, 1),
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopify_outlined,
                    color: currentPage == 2
                        ? const Color.fromRGBO(0, 161, 154, 1)
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
                        ? const Color.fromRGBO(0, 161, 154, 1)
                        : const Color.fromRGBO(40, 40, 40, 1),
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: currentPage == 3
                        ? const Color.fromRGBO(0, 161, 154, 1)
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
                        ? const Color.fromRGBO(0, 161, 154, 1)
                        : const Color.fromRGBO(40, 40, 40, 1),
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: currentPage == 4
                        ? const Color.fromRGBO(0, 161, 154, 1)
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
                    color: currentPage == 3
                        ? const Color.fromRGBO(0, 161, 154, 1)
                        : const Color.fromRGBO(40, 40, 40, 1),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
