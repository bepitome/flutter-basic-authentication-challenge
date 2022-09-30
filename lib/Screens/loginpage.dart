import 'package:flutter/material.dart';
import '../API/auth.dart';
import '../../Screens/ProfileScreen.dart';
import 'allUsers.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  auth api = auth();

  var res;

final usernameController= TextEditingController();

final passwordController = TextEditingController();

 final response='';


  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(title: Text("Login Page"),
          backgroundColor: Color.fromRGBO(170, 126, 189, 100),),
          body: Center(
            child: Stack(
              children:<Widget> [

          Center(
          child :Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.height * 0.4,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 75),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Image(
                          image: AssetImage('images/3898671.png')),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromRGBO(170, 126, 189, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                      child:TextField(
                        decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                  controller: usernameController,
                ),
                ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                      child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: passwordController,
                ),
                ),
                      Padding(padding: EdgeInsets.all(20),
                      child:Row(
                          children: [
                          loginButton(),
                    ],
                  )
                      ),

                    ],
                  ),
                ),
                ),
              ),
          ),
          ),
              ],
            )
          ),
    ),
    );
  }

  Widget loginButton(){
    return ElevatedButton(
        child: Text("Login"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          backgroundColor: Color.fromRGBO(170, 126, 189, 100)
        ),
        onPressed :() async {
      auth.setUsername(usernameController.text);
      auth.setPassword(passwordController.text);

      await api.fetchToken();


        Navigator.pushReplacement(context,
    MaterialPageRoute(builder:
    (context) => const wrapper()));

      }

    );
    }

}