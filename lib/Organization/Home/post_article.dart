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
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurpleAccent.withAlpha((0.05 * 255).toInt()), // Shadow color with opacity
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
              'Create Article',
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
        padding: const EdgeInsets.all(0.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                  margin: EdgeInsets.symmetric(vertical: 0),
                  height: 35,
                  color: Colors.teal[700],
                  child: Text(
                    'Create Article',
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: TextFormField(
                    controller: _headlineController,
                    decoration: InputDecoration(
                      labelText: '1. Headline',
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
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '2. Input',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    _buildStyleRadioButton('Type Text'),
                    _buildStyleRadioButton('Upload document'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        '3. Upload Cover Image...',
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
                  height: 20,
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
                      'Post',
                      style: TextStyle(color: Colors.white),
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
                : Colors.deepPurpleAccent,
          ),
        ),
        selected: _selectedTypes.contains(type),
        onSelected: (selected) {
          _toggleType(type);
        },
        backgroundColor: Colors.white, // Background color when not selected
        selectedColor: Colors.deepPurpleAccent, // Background color when selected
        side: _selectedTypes.contains(type)
            ? BorderSide.none // No border when selected
            : BorderSide(
                color: Colors.deepPurpleAccent, // Border color when not selected
              ),
      ),
    );
  }
}
