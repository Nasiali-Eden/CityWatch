import 'package:flutter/material.dart';

class PostIncident extends StatefulWidget {
  const PostIncident({super.key});

  @override
  State<PostIncident> createState() => _PostIncidentState();
}

class _PostIncidentState extends State<PostIncident> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _headlineController = TextEditingController();

  String _headline = '';
  String _description = '';

  void _onHeadlineChanged(String value) {
    setState(() {
      _headline = value;
    });
  }

  void _onDescriptionChanged(String value) {
    setState(() {
      _description = value;
    });
  }

  final List<String> _selectedTypes = [];

  void _toggleType(String type) {
    setState(() {
      if (_selectedTypes.contains(type)) {
        // If the type is already selected, deselect it
        _selectedTypes.remove(type);
      } else {
        // If the type is not selected, clear the list and select the new type
        _selectedTypes.clear();
        _selectedTypes.add(type);
      }
    });
  }

  void _toggleLocation(String location) {
    setState(() {
      if (_selectedTypes.contains(location)) {
        _selectedTypes.remove(location);
      } else {
        _selectedTypes.clear();
        _selectedTypes.add(location);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(56.0), // Set the height of the AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple[700],
            boxShadow: [
              BoxShadow(
                color: Colors.white.withAlpha(
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
              'Report Incident',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    margin: EdgeInsets.symmetric(vertical: 0),
                    height: 35,
                    color: Colors.teal[700],
                    child: Text(
                      'New Report',
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: TextFormField(
                  controller: _headlineController,
                  decoration: InputDecoration(
                    labelText: '1. Input Headline',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 0.1),
                    ),
                  ),
                  onChanged: _onHeadlineChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add the headline';
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
                child: Text(
                  '2. What type of Incident are you reporting?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 3,
                runSpacing: 2,
                children: [
                  _buildStyleRadioButton('Health'),
                  _buildStyleRadioButton('Fire'),
                  _buildStyleRadioButton('Floods'),
                  _buildStyleRadioButton('Wildlife'),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: '3. Description of Incident',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 0.1),
                    ),
                  ),
                  onChanged: _onDescriptionChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add Description';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '4. Choose Location',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 8,
                children: [
                  _buildLocationRadioButton('Use Current Location'),
                  _buildLocationRadioButton('Use Custom Location'),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      '5. Click if you wish to add images...',
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
                height: 35,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Post',
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

  Widget _buildStyleRadioButton(String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: FilterChip(
        label: Text(
          type,
          // Conditional text color based on selection
          style: TextStyle(
            color: _selectedTypes.contains(type)
                ? Colors.white
                : Colors.deepPurple,
          ),
        ),
        selected: _selectedTypes.contains(type),
        onSelected: (selected) {
          _toggleType(type);
        },
        backgroundColor: Colors.white, // Background color when not selected
        selectedColor: Colors.deepPurple, // Background color when selected
        side: _selectedTypes.contains(type)
            ? BorderSide.none // No border when selected
            : BorderSide(
                color: Colors.deepPurple, // Border color when not selected
              ),
      ),
    );
  }

  Widget _buildLocationRadioButton(String location) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: FilterChip(
        label: Text(
          location,
          // Conditional text color based on selection
          style: TextStyle(
            color: _selectedTypes.contains(location)
                ? Colors.white
                : Colors.deepPurple,
          ),
        ),
        selected: _selectedTypes.contains(location),
        onSelected: (selected) {
          _toggleLocation(location);
        },
        backgroundColor: Colors.white,
        // Background color when not selected
        selectedColor: Colors.deepPurple,
        // Background color when selected
        side: _selectedTypes.contains(location)
            ? BorderSide.none // No border when selected
            : BorderSide(
          color: Colors.deepPurple, // Border color when not selected
        ),
      ),
    );
  }
}
