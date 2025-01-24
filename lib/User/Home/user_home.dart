import 'package:citywatch/User/Home/Help/user_help.dart';
import 'package:citywatch/User/Home/HomeScreen/user_homescreen.dart';
import 'package:citywatch/User/Home/Profile/user_profile.dart';
import 'package:citywatch/User/Home/Reports/user_reports.dart';
import 'package:flutter/material.dart';


class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int currentPage = 0;

  final List<Widget> pages = [
    const UserHomeScreen(),
    const UserReports(),
    const UserHelp(),
    const UserProfile(),
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
                  'Home',
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
                    Icons.map_outlined,
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
                  'Reports',
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
                    Icons.help,
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
                  'Help',
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
                    Icons.person,
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
                  'Profile',
                  style: TextStyle(
                    fontSize: 11.0,
                    color: currentPage == 3
                        ? const Color.fromRGBO(124, 77, 255, 1.0)
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
