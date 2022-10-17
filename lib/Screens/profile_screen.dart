import 'dart:convert';
import 'package:basic_authentication_flutter_challenge/Screens/login_page.dart';
import 'package:basic_authentication_flutter_challenge/Screens/all_users.dart';
import 'package:flutter/material.dart';
import 'package:basic_authentication_flutter_challenge/api/auth_user.dart';




class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Auth api = Auth();

  String fname = '';
  String lname = '';
  String email = '';
  String username = '';
  String company = '';
  String gender = '';



  void getInfo() async {
    final jsonInfo = jsonDecode(await api.userAuth());


    try {
      setState(() {
        fname = jsonInfo["result"]["first_name"];
        lname = jsonInfo["result"]["last_name"];
        email = jsonInfo["result"]["email"];
        username = jsonInfo["result"]["username"];
        company = jsonInfo["result"]["company"];
        gender = jsonInfo["result"]["gender"];
      });
    }
    catch (ex) {
      throw Exception("Error fetching data");
    }
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Information'),
        backgroundColor: const Color.fromRGBO(170, 126, 189, 100),),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.circle),
            title: Text("First name: $fname"),
          ),
          ListTile(
            leading: const Icon(Icons.circle),
            title: Text("Last name: $lname"),
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: Text("Email: $email"),
          ),
          ListTile(
            leading: const Icon(Icons.circle),
            title: Text("Username: $username"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text("Gender: $gender"),
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: Text("Company: $company"),
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () { Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => const AllUsers())); },
              style: ElevatedButton.styleFrom( backgroundColor: const Color.fromRGBO(170, 126, 189, 100),

              ),
              child: const Text("Show all Users"),
            ),
          ),
          ListTile(
            title:  logoutButton(),
          )
        ],
      ),
    );
  }

  Widget logoutButton() {
    return ElevatedButton(
        onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => const LoginPage()));
        },
        style: ElevatedButton.styleFrom( backgroundColor: const Color.fromRGBO(170, 126, 189, 100)), child: const Text("Log out"));
  }
}
