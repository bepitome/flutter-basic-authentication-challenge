import 'package:basic_authentication_flutter_challenge/Screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const SignUpScreen());
  }
}
