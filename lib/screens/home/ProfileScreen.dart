import 'dart:convert';

import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../components/MyCard.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String username = '';
  String company = '';
  String gender = '';

  void setValues() async {
    var decodedData = json.decode(await API.getUser());

    print(decodedData['result']['first_name']);

    setState(() {
      try {
        firstName = decodedData['result']['first_name'];
        lastName = decodedData['result']['last_name'];
        email = decodedData['result']['email'];
        username = decodedData['result']['username'];
        company = decodedData['result']['company'];
        gender = decodedData['result']['gender'];
      } catch (e) {
        print('Error');
      }
    });
  }

  @override
  void initState() {
    setValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              MyCard(name: 'First Name', value: firstName),
              MyCard(name: 'Last Name', value: lastName),
              MyCard(name: 'Email', value: email),
              MyCard(name: 'Username', value: username),
              MyCard(name: 'Company', value: company),
              MyCard(name: 'Gender', value: gender),
            ],
          ),
        ),
      ),
    );
  }
}
