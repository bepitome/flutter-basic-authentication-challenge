import 'package:basic_authentication_flutter_challenge/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:basic_authentication_flutter_challenge/Services/api.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void homePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePageScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('login screen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: "username",
                        hintText: "enter username",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: "password",
                        hintText: "enter password",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () async {
                          String username = userNameController.text.toString();
                          String password = passwordController.text.toString();
                          if (username.isNotEmpty && password.isNotEmpty) {
                            Future.delayed(Duration.zero).then((value) =>
                                showSnackBar(context, "logging in...."));
                            bool checkLogin =
                                await Authentication.login(username, password);
                            if (checkLogin) {
                              await Authentication.getUser();
                              await Authentication.getAllUsers();
                              homePage();
                            } else {
                              Future.delayed(Duration.zero).then((value) =>
                                  showSnackBar(
                                      context, "Wrong username or password"));
                            }
                          } else {
                            Future.delayed(Duration.zero).then((value) =>
                                showSnackBar(
                                    context, "Username or password is empty"));
                          }
                        },
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: const Text('login'),
                      ),
                    ),
                  )
                ],
              )),
            ),
          ],
        ));
  }
}
