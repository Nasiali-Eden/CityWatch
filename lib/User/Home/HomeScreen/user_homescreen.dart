import 'package:city_watch/Shared/Inputs/post_incident.dart';
import 'package:flutter/material.dart';

import '../volunteer_reg.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => UserHomeScreenState();
}

class UserHomeScreenState extends State<UserHomeScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  // Call this method to pop the nested navigator back to the home (root) page.
  void popToRoot() {
    _navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  // Show the popup menu for the + button.
  void _showMenu(BuildContext context, Offset offset) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
      color: Colors.white,
      items: [
        PopupMenuItem(
          value: 'report',
          child: ListTile(
            leading: const Icon(Icons.report, color: Colors.deepPurpleAccent),
            title: const Text('Report Incident'),
          ),
        ),
        PopupMenuItem(
          value: 'volunteer',
          child: ListTile(
            leading: const Icon(Icons.volunteer_activism, color: Colors.teal),
            title: const Text('Become a Volunteer'),
          ),
        ),
      ],
    ).then((value) {
      if (value == 'report') {
        _navigatorKey.currentState?.pushNamed('/postIncident');
      } else if (value == 'volunteer') {
        _navigatorKey.currentState?.pushNamed('/volunteer');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurpleAccent.withAlpha((0.05 * 255).toInt()),
                blurRadius: 4.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.deepPurpleAccent),
                onPressed: () {
                  RenderBox? overlay = Overlay.of(context)
                      .context
                      .findRenderObject() as RenderBox?;
                  Offset offset = overlay?.localToGlobal(overlay.size.topRight(Offset.zero)) ??
                      Offset.zero;
                  _showMenu(context, offset);
                },
              ),
            ],
          ),
        ),
      ),
      // Nested navigator for child routes.
      body: Navigator(
        key: _navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext _) => const HomeContent();
              break;
            case '/postIncident':
              builder = (BuildContext _) => const PostIncident();
              break;
            case '/volunteer':
              builder = (BuildContext _) => const VolunteerReg();
              break;
            default:
              builder = (BuildContext _) => const HomeContent();
          }
          return MaterialPageRoute(
            builder: builder,
            settings: settings,
          );
        },
      ),
    );
  }
}

/// The default home content.
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 15),
          Divider(
            color: Colors.teal,
            thickness: 3.0,
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Top Updates',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Additional Home content can go here.
        ],
      ),
    );
  }
}
