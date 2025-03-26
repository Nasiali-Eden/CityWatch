import 'package:city_watch/Shared/Inputs/post_incident.dart';
import 'package:flutter/material.dart';

import '../../Articles/post_article.dart';

class OrgDashboard extends StatefulWidget {
  const OrgDashboard({super.key});

  @override
  OrgDashboardState createState() => OrgDashboardState();
}

class OrgDashboardState extends State<OrgDashboard> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void popToRoot() {
    _navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  void _showMenu(BuildContext context, Offset offset) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
      items: [
        PopupMenuItem(
          value: 'uploadArticle',
          child: ListTile(
            leading: const Icon(Icons.article, color: Colors.teal),
            title: const Text('Upload Article'),
          ),
        ),
        PopupMenuItem(
          value: 'uploadIncident',
          child: ListTile(
            leading: const Icon(Icons.report, color: Colors.teal),
            title: const Text('Upload Incident'),
          ),
        ),
      ],
    ).then((value) {
      if (value == 'uploadArticle') {
        _navigatorKey.currentState?.pushNamed('/uploadArticle');
      } else if (value == 'uploadIncident') {
        _navigatorKey.currentState?.pushNamed('/uploadIncident');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              'Dashboard',
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
      body: Navigator(
        key: _navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext _) => const _DashboardContent();
              break;
            case '/uploadArticle':
              builder = (BuildContext _) => PostArticle();
              break;
            case '/uploadIncident':
              builder = (BuildContext _) => PostIncident();
              break;
            default:
              builder = (BuildContext _) => const _DashboardContent();
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

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0.0),
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          height: 31,
          color: Colors.deepPurpleAccent[200],
          child: const Text(
            'Reports Summary',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        // Additional dashboard content...
      ],
    );
  }
}
