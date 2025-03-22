import 'package:flutter/material.dart';

class VolunteerReg extends StatefulWidget {
  const VolunteerReg({super.key});

  @override
  State<VolunteerReg> createState() => _VolunteerRegState();
}

class _VolunteerRegState extends State<VolunteerReg> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();

  // State variables to hold the selected values
  String _skill = '';
  String _availability = '';
  String _name = '';

  // Dropdown options
  final List<String> _skillOptions = [
    'Medical',
    'Physical',
    'Financial',
    'Legal',
    'Emotional',
    'Shelter',
    'Office-Work',
  ];

  final List<String> _availabilityOptions = [
    'Full-Time',
    'When Needed',
  ];

  // Update name as the user types
  void _onNameChanged(String value) {
    setState(() {
      _name = value;
    });
  }

  // Called when the user presses "Register"
  void _onRegisterPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // All fields are valid, proceed with form submission
      debugPrint("Name: $_name");
      debugPrint("Skill: $_skill");
      debugPrint("Availability: $_availability");

      // ... Add your Firebase submission or other logic here ...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            // Header
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                  height: 35,
                  color: Colors.teal[700],
                  child: const Text(
                    'Register as volunteer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            // Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '1. Full Names',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: UnderlineInputBorder(
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

            // Skill Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                value: _skill.isNotEmpty ? _skill : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: '2. Choose your Skills',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 0.1),
                  ),
                ),
                items: _skillOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _skill = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a skill';
                  }
                  return null;
                },
              ),
            ),

            // Availability Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                value: _availability.isNotEmpty ? _availability : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: '3. Confirm availability',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 0.1),
                  ),
                ),
                items: _availabilityOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _availability = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your availability';
                  }
                  return null;
                },
              ),
            ),

            // Photo Upload
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    '4. Add a Passport Size photo',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement photo selection logic
                    },
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: 21,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),

            // Register Button
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _onRegisterPressed,
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
