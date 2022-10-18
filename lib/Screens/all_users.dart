import 'dart:convert';
import 'package:basic_authentication_flutter_challenge/Screens/login_page.dart';
import '../../Screens/profile_screen.dart';
import 'package:flutter/material.dart';


class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {

  LoginPage user= LoginPage();

  List<ListTile> userTiles=[];
   Future<void> getUsers() async {
     try{
       var response = jsonDecode(await user.api.fetchUsers());
       response=response['result'] as List;

       setState(() {
         for (var i in response){
           if(i['company']=='Feedfire'){
           userTiles.add(ListTile(
             title: Text("${i['first_name']} ${i['last_name']} ")));}
         }
       });
     }
     catch(ex){
       throw Exception("Couldn't load data");
     }

    }

  @override
  void initState() {
    getUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Teammate List"),
      backgroundColor: const Color.fromRGBO(170, 126, 189, 100),),
      body: ListView(
        shrinkWrap: true,
        children: [
          ...userTiles,
          ListTile(
            title: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(170, 126, 189, 100)),
              onPressed: () { Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => const ProfilePage())); },
              child: const Text("Back To Profile"),

            ),
          )
        ],
      ),
    );
  }
}
