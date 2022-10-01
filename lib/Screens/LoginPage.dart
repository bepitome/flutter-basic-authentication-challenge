import 'package:flutter/material.dart';
import '../API/Auth.dart';
import '../../Screens/ProfileScreen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Auth api = Auth();
final usernameController= TextEditingController();

final passwordController = TextEditingController();

 final response='';


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(title: const Text("Login Page"),
          backgroundColor: const Color.fromRGBO(170, 126, 189, 100),),
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
                      const SizedBox(
                        height: 15,
                      ),
                      const Image(
                          image: AssetImage('images/3898671.png')),
                      const Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromRGBO(170, 126, 189, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                      child:TextField(
                        decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                  controller: usernameController,
                ),
                ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                      child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: passwordController,
                ),
                ),
                      Padding(padding: const EdgeInsets.all(20),
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
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          backgroundColor: const Color.fromRGBO(170, 126, 189, 100)
        ),
        onPressed :() async {
      Auth.setUsername(usernameController.text);
      Auth.setPassword(passwordController.text);

      await api.fetchToken();


        Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                          (context) => const ProfilePage()));

      },
        child: const Text("Login")

    );
    }

}