import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfileTile extends StatelessWidget {
  final Profile profile;
  const ProfileTile(this.profile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile-placeholder.png'),
      ),
      title: Text('${profile.lastName}, ${profile.firstName}'),
      subtitle: Text('Email: ${profile.email}\nCompany: ${profile.company}'),
      onTap: () {},
    );
  }
}
