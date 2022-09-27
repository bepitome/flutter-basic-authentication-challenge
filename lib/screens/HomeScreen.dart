import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

import 'home/AllUsersScreen.dart';
import 'home/ChangePasswordScreen.dart';
import 'home/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();
  void goToPage(int index) {
    setState(
      () {
        _controller.animateToPage(index,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.person, color: Color(0xFF6C63FF)),
          Icon(Icons.home, color: Color(0xFF6C63FF)),
        ],
        inactiveIcons: [
          Icon(Icons.person, color: Colors.indigoAccent[100]),
          Icon(Icons.home, color: Colors.indigoAccent[100]),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        initIndex: 0,
        onChanged: (index) {
          goToPage(index);
        },
        // tabCurve: ,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: const [
          ProfileScreen(),
          AllUsersScreen(),
        ],
      ),
    );
  }
}
