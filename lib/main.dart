import 'package:basic_authentication_flutter_challenge/Screens/signUpScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}
