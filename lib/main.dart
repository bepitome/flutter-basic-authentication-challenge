import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            secondary: Colors.deepOrange,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
        title: const Text('test'),
      )),
    );
  }
}
