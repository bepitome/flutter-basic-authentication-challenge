import 'dart:convert';
import 'package:app/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../API/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

// Create login Page with username and password
class _LoginPage extends State<LoginPage> {
  // Variables
  bool _passwordVisible = false;
  TextEditingController usernameForm = TextEditingController();
  TextEditingController passwordForm = TextEditingController();
  // Go to next page
  void toNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  Future login() async {
    // get username and password from TextFormFields
    String username = usernameForm.text;
    String password = passwordForm.text;

    if (username.isNotEmpty || password.isNotEmpty) {
      setState(() {
        showsnackbar(context, "Logging in");
      });

      // convert username and password to base64 using username:password
      String basicAuth =
          'Basic ${base64Encode(utf8.encode('$username:$password'))}';

      // wait for API request as boolean value
      bool login = await Auth.login(basicAuth);

      // if login is true, navigate to home page
      if (login) {
        // Navigate to home page
        toNextPage();
      } else {
        // if login is false, show error message asynchronously
        setState(() {
          showsnackbar(context, "Login Failed");
        });
      }
    } else {
      // If fields are empty, show error message asynchronously
      setState(() {
        showsnackbar(context, "Please fill in all fields");
      });
    }
  }

  // Show error messages and user feedback
  void showsnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1, milliseconds: 500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: usernameForm,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your Username',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordForm,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toggle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await login();
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
