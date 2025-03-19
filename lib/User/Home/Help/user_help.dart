import 'package:flutter/material.dart';

class UserHelp extends StatefulWidget {
  const UserHelp({super.key});

  @override
  State<UserHelp> createState() => _UserHelpState();
}

class _UserHelpState extends State<UserHelp> {
  @override
  Widget build(BuildContext context) {
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
              'Help and Resources',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("HelpLines",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            SizedBox(height: 18,),
            _buildButton(context, "Police Services"),
            _buildButton(context, "Ambulance Services"),
            _buildButton(context, "Kenya Red Cross"),
            SizedBox(height: 16),
            Text("Nearby Resources",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            SizedBox(height: 18),
            _buildButton(context, "Refugee Camps"),
            _buildButton(context, "Government Shelters"),
            _buildButton(context, "Free Medical Services"),
            _buildButton(context, "Relief Aid"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        // Add action here
        print("$text tapped");
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
        ),
      ),
    );
  }
}
