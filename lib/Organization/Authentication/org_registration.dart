import 'package:flutter/material.dart';
import '../../Reusables/footer/footer.dart';
import '../../Reusables/footer/logo.dart';
import '../../Reusables/inputfields/textfields.dart';
import '../../Services/Authentication/auth.dart';
import '../../Shared/login.dart';


class OrganizationRegistration extends StatefulWidget {
  const OrganizationRegistration({super.key});

  @override
  _OrganizationRegistrationState createState() => _OrganizationRegistrationState();
}

enum gender { male, female }

class _OrganizationRegistrationState extends State<OrganizationRegistration> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  final TextEditingController NameController = TextEditingController();
  final TextEditingController TypeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ContactController = TextEditingController();
  final TextEditingController LocationController = TextEditingController();

  String email = '';
  String password = '';
  String name = '';
  String type = '';
  String contact = '';
  String location = '';

  void _onEmailChanged(String value) {
    setState(() {
      email = value;
    });
  }

  void _onPasswordChanged(String value) {
    setState(() {
      password = value;
    });
  }

  void _onLocationChanged(String value) {
    setState(() {
      location = value;
    });
  }

  void _onNameChanged(String value) {
    setState(() {
      name = value;
    });
  }

  void _onTypeChanged(String value) {
    setState(() {
      type = value;
    });
  }

  void _onContactChanged(String value) {
    setState(() {
      contact = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                      fontSize: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  validator: (value) => value!.isEmpty ? 'Enter First Name' : null,
                  obscureText: false,
                  controller: NameController,
                  labelText: 'Organization Name',
                  onChanged: _onNameChanged,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  validator: (value) => value!.isEmpty ? 'Enter Last Name' : null,
                  obscureText: false,
                  controller: TypeController,
                  labelText: 'Organization Type(e.g Health)',
                  onChanged: _onTypeChanged,
                ),
                const SizedBox(height: 10),

                MyTextField(
                  validator: (value) => value!.isEmpty ? 'Enter Last Name' : null,
                  obscureText: false,
                  controller: ContactController,
                  labelText: 'Phone Number',
                  onChanged: _onContactChanged,
                ),
                const SizedBox(height: 10),

                MyTextField(
                  validator: (value) => value!.isEmpty ? 'Enter Last Name' : null,
                  obscureText: false,
                  controller: LocationController,
                  labelText: 'Location',
                  onChanged: _onLocationChanged,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  labelText: 'Email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter an email';
                    }
                    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  obscureText: false,
                  onChanged: _onEmailChanged,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) =>
                  value!.length < 6 ? 'Password must be at least 6 characters' : null,
                  labelText: 'Password',
                  onChanged: _onPasswordChanged,
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 105),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _authService.signUp(
                          emailController.text,
                          passwordController.text,
                          'Organization',
                          {
                            'Name': NameController.text,
                            'Location': LocationController.text,
                            'Type': TypeController.text,
                            'Contact': ContactController.text,
                          },
                        ).then((result) {
                          if (result != null) {
                            LoginPage();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sign-up failed. Please try again.')),
                            );
                          }
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('An error occurred: $error')),
                          );
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Footer(),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FooterLogoTeal(),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
