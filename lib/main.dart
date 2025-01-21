import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
                'CityWatch',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      body: Center(
        child: Text('CityWatch'),
      )

    );
  }
}
