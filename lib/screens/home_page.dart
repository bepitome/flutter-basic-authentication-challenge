import 'package:app/API/auth.dart';
import 'package:app/screens/profile_page.dart';
import 'package:app/screens/teams_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool isLoading = true;
  void getInfo() async {
    // Get user info from API
    await Auth.fetchUser();
    await Auth.fetshAllUsers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  // List of page screens
  final List<Widget> _widgetOptions = <Widget>[
    const ProfilePage(),
    const TeamPage(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: isLoading
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              // Set the page based on selected index
              body: _widgetOptions[_selectedIndex],
              // bottom Bar that has Profile and Team
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.group),
                    label: 'Team',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.red,
                onTap: (int index) {
                  // Change state based on index
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
    );
  }
}
