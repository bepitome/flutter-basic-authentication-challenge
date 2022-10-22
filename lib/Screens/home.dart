import 'dart:convert';

import 'package:basic_authentication_flutter_challenge/Screens/allUsers.dart';
import 'package:basic_authentication_flutter_challenge/Screens/signUpScreen.dart';
import 'package:basic_authentication_flutter_challenge/Services/api.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

class homePageScreen extends StatefulWidget {
  const homePageScreen({super.key});

  @override
  State<homePageScreen> createState() => _homePageScreenState();
}

class _homePageScreenState extends State<homePageScreen> {
  bool isLoading = true;
  Person person = new Person();
  void getData() async {
    var response = jsonDecode(await Authentication.getAllUsers());
    response = response['result'] as List;
    setState(() {
      for (var i in response) {
        Person pp = new Person();
        pp.result = Result.fromJson(i);
        if (pp.result?.username == Authentication.username) {
          person = pp;
        }
      }
    });
    isLoading = false;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Center(
                    child: Profile(
                      imageUrl: person.result?.gender == "Male"
                          ? "https://cdn-icons-png.flaticon.com/512/186/186036.png"
                          : "https://cdn-icons-png.flaticon.com/512/186/186037.png",
                      name:
                          "${person.result?.firstName} ${person.result?.lastName}",
                      website: "",
                      designation:
                          "Software Engineer at ${person.result?.company}",
                      email: "${person.result?.email}",
                      phone_number: "",
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.teal,
                        child: Center(child: Text('login screen'))),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.teal,
                        child: Center(child: Text('users screen'))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const allUsers()),
                      );
                    },
                  )
                ],
              ));
  }
}

class Person {
  Result? result;

  Person({this.result});

  Person.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? sId;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? company;
  String? password;
  String? gender;

  Result(
      {this.sId,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.company,
      this.password,
      this.gender});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    company = json['company'];
    password = json['password'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['company'] = this.company;
    data['password'] = this.password;
    data['gender'] = this.gender;
    return data;
  }
}
