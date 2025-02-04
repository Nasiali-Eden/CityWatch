import 'package:flutter/material.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({super.key});

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _teamNameController = TextEditingController();
  final List<TextEditingController> _teamLeadsControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _rolesControllers = [
    TextEditingController()
  ];
  final List<Map<String, dynamic>> _teamMembers = [];

  bool showForm = false;

  void _addTeamLead() {
    if (_teamLeadsControllers.last.text.isNotEmpty) {
      setState(() {
        _teamLeadsControllers.add(TextEditingController());
      });
    }
  }

  void _addRole() {
    if (_rolesControllers.last.text.isNotEmpty) {
      setState(() {
        _rolesControllers.add(TextEditingController());
      });
    }
  }

  void _addTeamMember() {
    if (_teamMembers.isEmpty || _teamMembers.last['name'].text.isNotEmpty) {
      setState(() {
        _teamMembers.add({
          'name': TextEditingController(),
          'role': null,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        elevation: 0,
        title: const Text(
          'Edit Teams',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton('Add New Team', () {
                    setState(() {
                      showForm = true;
                    });
                  }),
                  _buildActionButton('Edit Teams', () {}),
                ],
              ),
              const SizedBox(height: 10),
              if (showForm) _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.cyan[700],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromRGBO(182, 182, 182, 1.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField('Team Name', _teamNameController),
          const SizedBox(height: 15),
          _buildDynamicFields('Team Lead', _teamLeadsControllers, _addTeamLead),
          _buildDynamicFields('Roles', _rolesControllers, _addRole),
          _buildTeamMembersSection(),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Add Team',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (value) => value!.isEmpty ? 'This field is required' : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
        const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black54)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black87, width: 0.1)),
      ),
    );
  }

  Widget _buildDynamicFields(String label,
      List<TextEditingController> controllers, VoidCallback onAdd) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var controller in controllers) _buildTextField(label, controller),
        TextButton(
            onPressed: onAdd,
            child: const Text('+ Add',
                style: TextStyle(color: Colors.teal, fontSize: 16))),
      ],
    );
  }

  Widget _buildTeamMembersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Add Team Members',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.black)),
        for (var member in _teamMembers)
          Row(
            children: [
              Expanded(child: _buildTextField('Member Name', member['name'])),
              const SizedBox(width: 10),
              DropdownButton<String>(
                hint: const Text('Select Role'),
                value: member['role'],
                onChanged: (value) {
                  setState(() {
                    member['role'] = value;
                  });
                },
                items: _rolesControllers.map((controller) {
                  return DropdownMenuItem<String>(
                    value: controller.text,
                    child: Text(controller.text,
                        style: const TextStyle(fontSize: 16)),
                  );
                }).toList(),
              ),
            ],
          ),
        TextButton(
            onPressed: _addTeamMember,
            child: const Text('+ Add Member',
                style: TextStyle(color: Colors.teal, fontSize: 16))),
      ],
    );
  }
}