import 'package:app/API/auth.dart';
import 'package:app/model/user.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  // Get stored user from Auth class
  User user = Auth.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Profile app Bar
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      // Show user information
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 100,
            ),
            const Text(
              "User Profile",
              style: TextStyle(fontSize: 30),
            ),
            Expanded(
              child: ListTile(
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text("${user.email}\n${user.gender}"),
                trailing: Text("${user.company}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
