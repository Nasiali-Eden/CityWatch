import 'package:flutter/material.dart';
import '../../Reusables/footer/footer.dart';
import '../../Reusables/footer/logo.dart';
import '../../Reusables/inputfields/password.dart';
import '../../Reusables/inputfields/textfields.dart';
import '../../Services/Authentication/auth.dart';
import '../../Shared/Pages/login.dart';


class OrganizationRegistration extends StatefulWidget {
  const OrganizationRegistration({super.key});

  @override
  _OrganizationRegistrationState createState() => _OrganizationRegistrationState();
}

enum type { Health, Police, Fire, Floods, Wildlife,}

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
  String contact = '';
  String location = '';


  type? _type = type.Police;
  void _onTypeChanged(type? value) {
    setState(() {
      _type = value;
    });
  }


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
                      color: Colors.deepPurple,
                      fontSize: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  validator: (value) => value!.isEmpty ? 'Enter Org Name' : null,
                  obscureText: false,
                  controller: NameController,
                  labelText: 'Organization Name',
                  onChanged: _onNameChanged,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Organization Type:',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.deepPurpleAccent),
                      ),
                      const SizedBox(height: 8), // Add spacing between text and buttons
                      Wrap(
                        spacing: 7, // Space between radio buttons
                        runSpacing: 0, // Space between lines if wrapped
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<type>(
                                groupValue: _type,
                                value: type.Health,
                                onChanged: (type? value) {
                                  _onTypeChanged(value);
                                },
                                activeColor: Colors.deepPurple,
                              ),
                              const Text('Health'),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<type>(
                                groupValue: _type,
                                value: type.Floods,
                                onChanged: (type? value) {
                                  _onTypeChanged(value);
                                },
                                activeColor: Colors.deepPurple,
                              ),
                              const Text('Floods'),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<type>(
                                groupValue: _type,
                                value: type.Police,
                                onChanged: (type? value) {
                                  _onTypeChanged(value);
                                },
                                activeColor: Colors.deepPurple,
                              ),
                              const Text('Police'),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<type>(
                                groupValue: _type,
                                value: type.Fire,
                                onChanged: (type? value) {
                                  _onTypeChanged(value);
                                },
                                activeColor: Colors.deepPurpleAccent,
                              ),
                              const Text('Fire'),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<type>(
                                groupValue: _type,
                                value: type.Wildlife,
                                onChanged: (type? value) {
                                  _onTypeChanged(value);
                                },
                                activeColor: Colors.deepPurpleAccent,
                              ),
                              const Text('Wildlife'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                MyTextField(
                  validator: (value) => value!.isEmpty ? 'Enter Last Name' : null,
                  obscureText: false,
                  controller: ContactController,
                  labelText: 'Contact',
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
                PasswordInput(
                  controller: passwordController,
                  onChanged: _onPasswordChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
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
