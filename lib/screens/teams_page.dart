import 'package:app/API/auth.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPage();
}

class _TeamPage extends State<TeamPage> {
  // Get stored Teams from Auth class
  List<User> allUsers = Auth.allUsers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Team"),
        centerTitle: true,
      ),
      // Team Icon at the center of the page
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.group,
              size: 100,
            ),
            const Text(
              "Team",
              style: TextStyle(fontSize: 30),
            ),
            // Show all user information from a list of users
            Expanded(
              child: ListView.builder(
                itemCount: allUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  var user = allUsers[index];
                  return ListTile(
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text("${user.email}\n${user.gender}"),
                    trailing: Text("${user.company}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
