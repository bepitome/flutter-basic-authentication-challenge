import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/profile.dart';
import '../providers/profiles.dart';
import '../widgets/main_profile.dart';
import '../widgets/profile_tile.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile profile = Profile.dummyProfile;
  List<Profile> profiles = [];
  Future<void> _getProfiles() async {
    await Provider.of<Profiles>(context, listen: false).teamProfiles();
    setState(() {
      profiles = Provider.of<Profiles>(context, listen: false).profiles;
    });
  }

  Future<void> _getProfile() async {
    await Provider.of<Profiles>(context, listen: false).loggedinUserProfile();
    setState(() {
      profile = Provider.of<Profiles>(context, listen: false).profile;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _getProfile();
    _getProfiles();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          MainProfile(profile),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: profiles.length,
              itemBuilder: (ctx, i) => ProfileTile(profiles[i]),
            ),
          ),
        ],
      ),
    );
  }
}
