import 'package:citywatch/User/Home/Help/user_help.dart';
import 'package:citywatch/User/Home/HomeScreen/user_homescreen.dart';
import 'package:citywatch/User/Home/Profile/user_profile.dart';
import 'package:citywatch/User/Home/Reports/user_reports.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


class BuyerHome extends StatefulWidget {
  const BuyerHome({super.key});

  @override
  State<BuyerHome> createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
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
                  'Home',
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
                  'Reports',
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
                  'Help',
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
