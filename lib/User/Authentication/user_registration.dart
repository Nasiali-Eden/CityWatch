import 'package:flutter/material.dart';
import '../../Reusables/footer/footer.dart';
import '../../Reusables/footer/logo.dart';
import '../../Reusables/inputfields/textfields.dart';
import '../../Services/Authentication/auth.dart';
import '../../Shared/login.dart';


class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

enum gender { male, female }

class _UserRegistrationState extends State<UserRegistration> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String contact = '';

  gender? _gender = gender.male;
  void _onGenderChanged(gender? value) {
    setState(() {
      _gender = value;
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

  void _onFirstNameChanged(String value) {
    setState(() {
      firstName = value;
    });
  }

  void _onLastNameChanged(String value) {
    setState(() {
      lastName = value;
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
                      color: Colors.orange[700],
                      fontSize: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  validator: (value) => value!.isEmpty ? 'Enter First Name' : null,
                  obscureText: false,
                  controller: firstNameController,
                  labelText: 'First Name',
                  onChanged: _onFirstNameChanged,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  validator: (value) => value!.isEmpty ? 'Enter Last Name' : null,
                  obscureText: false,
                  controller: lastNameController,
                  labelText: 'Last Name',
                  onChanged: _onLastNameChanged,
                ),
                MyTextField(
                  validator: (value) => value!.isEmpty ? 'Enter Last Name' : null,
                  obscureText: false,
                  controller: contactController,
                  labelText: 'Phone Number',
                  onChanged: _onContactChanged,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Text('Gender:'),
                      const SizedBox(width: 16),
                      Radio<gender>(
                        groupValue: _gender,
                        value: gender.male,
                        onChanged: (gender? value) {
                          _onGenderChanged(value);
                        },
                        activeColor: Colors.teal,
                      ),
                      const Text('Male'),
                      const SizedBox(width: 16),
                      Radio<gender>(
                        groupValue: _gender,
                        value: gender.female,
                        onChanged: (gender? value) {
                          _onGenderChanged(value);
                        },
                        activeColor: Colors.teal,
                      ),
                      const Text('Female'),
                    ],
                  ),
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
                      backgroundColor: Colors.orange[700],
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
                          'user',
                          {
                            'First Name': firstNameController.text,
                            'Last Name': lastNameController.text,
                            'Contact': contactController.text,
                            'gender': _gender == gender.male ? 'male' : 'female',
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
