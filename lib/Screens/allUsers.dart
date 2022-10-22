import 'dart:convert';

import 'package:basic_authentication_flutter_challenge/Screens/home.dart';
import 'package:basic_authentication_flutter_challenge/Screens/signUpScreen.dart';
import 'package:basic_authentication_flutter_challenge/Services/api.dart';
import 'package:flutter/material.dart';

class allUsers extends StatefulWidget {
  const allUsers({super.key});

  @override
  State<allUsers> createState() => _allUsersState();
}

class _allUsersState extends State<allUsers> {
  bool isLoading = true;
  final List<Person> users = [];
  Person ourGuy = new Person();
  void getData() async {
    var response = jsonDecode(await Authentication.getAllUsers());
    response = response['result'] as List;

    setState(() {
      for (var i in response) {
        Person pp = new Person();
        pp.result = Result.fromJson(i);
        if (pp.result?.username == Authentication.username) {
          ourGuy = pp;
        }
      }
      for (var i in response) {
        Person pp = new Person();
        pp.result = Result.fromJson(i);
        if (pp.result?.company == ourGuy.result?.company &&
            pp.result?.username != ourGuy.result?.username) {
          users.add(pp);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("teamMates"),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: const Icon(Icons.person),
                    subtitle: Text("${users[index].result?.email}"),
                    trailing: Text(
                      "${users[index].result?.company}",
                      style: TextStyle(color: Colors.teal, fontSize: 15),
                    ),
                    title: Text(
                        "${users[index].result?.firstName} ${users[index].result?.lastName}, ${users[index].result?.gender}"));
              }),
    );
  }
}
