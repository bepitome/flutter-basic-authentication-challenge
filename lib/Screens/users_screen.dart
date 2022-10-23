import 'dart:convert';
import 'package:basic_authentication_flutter_challenge/Services/api.dart';
import 'package:basic_authentication_flutter_challenge/Services/person.dart';
import 'package:flutter/material.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  bool isLoading = true;
  final List<Person> users = [];
  Person ourGuy = Person();
  void getData() async {
    var response = jsonDecode(await Authentication.getAllUsers());
    response = response['result'] as List;
    var mainUser = await Authentication.getUser();
    ourGuy.result = Result.fromJson(jsonDecode(mainUser)['result']);

    setState(() {
      for (var i in response) {
        Person pp = Person();
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
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: const Icon(Icons.person),
                    subtitle: Text("${users[index].result?.email}"),
                    trailing: Text(
                      "${users[index].result?.company}",
                      style: const TextStyle(color: Colors.teal, fontSize: 15),
                    ),
                    title: Text(
                        "${users[index].result?.firstName} ${users[index].result?.lastName}, ${users[index].result?.gender}"));
              }),
    );
  }
}
