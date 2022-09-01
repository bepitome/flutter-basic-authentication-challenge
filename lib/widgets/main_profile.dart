import 'package:flutter/material.dart';
import '../models/profile.dart';

class MainProfile extends StatelessWidget {
  final Profile profile;
  const MainProfile(this.profile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProfile = profile;
    return Container(
      height: 300,
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black26,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const CircleAvatar(
            radius: 50,
            foregroundImage:
                AssetImage('assets/images/profile-placeholder.png'),
          ),
          Text(mainProfile.username),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('First name: ${mainProfile.firstName}'),
                Text('Last name: ${mainProfile.lastName}'),
                Text('Email: ${mainProfile.email}'),
                Text('Company: ${mainProfile.company}'),
                Text('Gender: ${mainProfile.gender.name}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
