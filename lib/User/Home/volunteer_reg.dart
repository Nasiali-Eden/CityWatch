import 'package:flutter/material.dart';

class VolunteerReg extends StatefulWidget {
  const VolunteerReg({super.key});

  @override
  State<VolunteerReg> createState() => _VolunteerRegState();
}

class _VolunteerRegState extends State<VolunteerReg> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();

  String _skill = '';
  String _availability = '';
  String _name = '';


  void _onSkillChanged(String value) {
    setState(() {
      _skill = value;
    });
  }

  void _onAvailabilityChanged(String value) {
    setState(() {
      _availability = value;
    });
  }
  void _onNameChanged(String value) {
    setState(() {
      _name = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch to full width
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    margin: EdgeInsets.symmetric(vertical: 0),
                    height: 35,
                    color: Colors.teal[700],
                    child: Text(
                      'Register as volunteer',
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: '1. Full Names',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 0.1),
                    ),
                  ),
                  onChanged: _onNameChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your full names';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: TextFormField(
                  controller: _skillController,
                  decoration: InputDecoration(
                    labelText: '2. Choose your Skills',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 0.1),
                    ),
                  ),
                  onChanged: _onSkillChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add the headline';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: TextFormField(
                  controller: _availabilityController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: '3. Confirm availability',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 0.1),
                    ),
                  ),
                  onChanged: _onAvailabilityChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add your availability';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Add a Passport Size photo',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 21,
                        color: Colors.grey[800],
                      ),
                      onTap: (){},
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
