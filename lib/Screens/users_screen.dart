import 'package:basic_authentication_flutter_challenge/Services/the_boys.dart';
import 'package:basic_authentication_flutter_challenge/models/person.dart';
import 'package:flutter/material.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  bool isLoading = true;

  List<Person> users = TheBoys.teamMates;
  void getFriends() async {
    if (users.isEmpty) {
      await TheBoys.getAllUsers();
    }

    setState(() {
      users = TheBoys.teamMates;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getFriends();
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
                Person currentUser = users[index];
                return ListTile(
                    leading: const Icon(Icons.person),
                    subtitle: Text("${currentUser.email}"),
                    trailing: Text(
                      "${currentUser.company}",
                      style: const TextStyle(color: Colors.teal, fontSize: 15),
                    ),
                    title: Text(
                        "${currentUser.firstName} ${currentUser.lastName}, ${currentUser.gender}"));
              }),
    );
  }
}
