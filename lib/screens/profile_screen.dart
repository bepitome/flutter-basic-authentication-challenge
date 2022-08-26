import '../widgets/main_profile.dart';
import 'package:flutter/material.dart';
import '../widgets/profile_tile.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(children: [
        MainProfile(),
        SizedBox(height: 10),
        ProfileTile(),
      ]),
    );
  }
}
