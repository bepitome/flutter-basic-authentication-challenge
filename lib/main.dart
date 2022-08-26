import 'package:flutter/material.dart';
import './screens/profile_screen.dart';

void main() {
  /**
   *    Welcome to Basic authentication challenge
   *    Make sure to read CHALLENGE.md before you start
   *
   */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
        fontFamily: 'Lato',
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.white,
          ),
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.indigo,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: const Color.fromRGBO(255, 254, 229, 1),
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}
