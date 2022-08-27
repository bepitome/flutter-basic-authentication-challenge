import 'package:basic_authentication_flutter_challenge/challenges.dart';
import 'package:basic_authentication_flutter_challenge/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injecDependencies();

  // Challenge 1 step 1, Authenticate
  await challenge1Step1();
  // Challenge 1 step 2, Display user data
  await challenge1Step2();
  // Display all employees who are working at the same company as a list
  await challenge1Step3();
}
