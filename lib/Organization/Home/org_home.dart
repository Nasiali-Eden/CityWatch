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

  // GlobalKey for OrgDashboard (the first page)
  final GlobalKey<OrgDashboardState> dashboardKey =
  GlobalKey<OrgDashboardState>();

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      OrgDashboard(key: dashboardKey),
      const UserReports(),
      const OrgTeam(),
      const OrgVolunteers(),
      const OrgProfile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Use an IndexedStack to preserve the state of each page
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:
              Colors.deepPurpleAccent.withAlpha((0.05 * 255).toInt()),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          height: 85.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Dashboard icon
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
                      if (currentPage == 0) {
                        // If already on Dashboard, reset its nested navigator.
                        dashboardKey.currentState?.popToRoot();
                      } else {
                        setState(() {
                          currentPage = 0;
                        });
                      }
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
              // Other bottom nav icons...
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
