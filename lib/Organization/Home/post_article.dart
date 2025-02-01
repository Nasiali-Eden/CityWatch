import 'package:flutter/material.dart';

class PostArticle extends StatefulWidget {
  const PostArticle({super.key});

  @override
  State<PostArticle> createState() => _PostArticleState();
}

class _PostArticleState extends State<PostArticle> {
  final List<String> _selectedTypes = [];
  final _formKey = GlobalKey<FormState>();

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

  final TextEditingController _headlineController = TextEditingController();
  String _headline = '';

  void _onHeadlineChanged(String value) {
    setState(() {
      _headline = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _headlineController,
                  decoration: InputDecoration(
                    labelText: 'Headline',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 0.1),
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
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    _buildStyleRadioButton('Use Current Location'),
                    _buildStyleRadioButton('Use Custom Location'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Upload Cover Image',
                    style: TextStyle(color: Colors.teal[600], fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Post',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ],
            )),
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
}
