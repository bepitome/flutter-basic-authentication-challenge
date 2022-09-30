import 'dart:convert';
import '../../Screens/ProfileScreen.dart';
import 'package:flutter/material.dart';

import '../API/auth.dart';

import 'package:flutter/cupertino.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  List<ListTile> users = [];
  auth api = auth();
  Future getUsers() async {
    var response = await api.fetchUsers();

    var jData = jsonDecode(response);


    jData= jData['result'];

     setState(
             () async{
       for ( var i in jData){
         if(i['company'] == 'Feedfire') {
           users.add(ListTile(
           title: Text("${i['first_name']} ${i['last_name']} ")));
         }

       }
     });
  }
  @override
  Widget build(BuildContext context) {
    print(users);
    return Scaffold(
      body: ListView(
        children: [
          ...users,
          ListTile(
            title: ElevatedButton(
              onPressed: () { Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => const wrapper())); },
              child: Text("Back To Profile"),

            ),
          )
        ],
      ),
    );
  }
}
