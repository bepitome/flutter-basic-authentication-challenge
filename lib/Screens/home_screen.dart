import 'dart:convert';
import 'package:basic_authentication_flutter_challenge/Screens/users_screen.dart';
import 'package:basic_authentication_flutter_challenge/Screens/sign_up_screen.dart';
import 'package:basic_authentication_flutter_challenge/Services/api.dart';
import 'package:basic_authentication_flutter_challenge/Services/person.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
  bool isLoading = true;
  Person person = Person();

  void getData() async {
    var data = await Authentication.getUser();

    setState(() {
      person.result = Result.fromJson(jsonDecode(data)['result']);
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Center(
                    child: Profile(
                      imageUrl: person.result?.gender == "Male"
                          ? "https://cdn-icons-png.flaticon.com/512/186/186036.png"
                          : "https://cdn-icons-png.flaticon.com/512/186/186037.png",
                      name:
                          "${person.result?.firstName} ${person.result?.lastName}",
                      website: "",
                      designation:
                          "Software Engineer at ${person.result?.company}",
                      email: "${person.result?.email}",
                      phone_number: "",
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.teal,
                        child: const Center(child: Text('login screen'))),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.teal,
                        child: const Center(child: Text('users screen'))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllUsers()),
                      );
                    },
                  )
                ],
              ));
  }
}
