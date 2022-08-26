import 'package:flutter/material.dart';
import '../providers/profile.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProfile = Profile.dummyProfile;
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
          SizedBox(height: 10),
          CircleAvatar(
            radius: 50,
            foregroundImage:
                AssetImage('assets/images/profile-placeholder.png'),
          ),
          Text('${mainProfile.username}'),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
