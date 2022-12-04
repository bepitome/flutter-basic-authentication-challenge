import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

import '../constants/colors.dart';
import 'HomeScreens/AllUsersScreen.dart';
import 'HomeScreens/ProfileScreen.dart';

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
        _controller.animateToPage(
          index,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.person, color: kMainColor),
          Icon(Icons.home, color: kMainColor),
        ],
        inactiveIcons: const [
          Icon(Icons.person, color: kUnfilledColor),
          Icon(Icons.home, color: kUnfilledColor),
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
