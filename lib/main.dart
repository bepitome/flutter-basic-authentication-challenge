
import 'package:flutter/material.dart';

import 'api.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  static const String title = 'Sample App';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
 
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void homePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SecondRoute()),
    );
  }
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Simple registration',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
             Container(
                height: 150.0,
                width: 190.0,
                  padding: const EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
              ),
              child: const Image(
              image: AssetImage('images/flutter-logo.png'),
              ),
            ),
                        Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: userNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            
    const SizedBox(height: 30),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () async {
                          //  var userNameController;
                            Authentication.username =
                                userNameController.text.toString();
                            Authentication.password =
                                passwordController.text.toString();
                            Authentication.userId =
                                await Authentication.getUserId();
                            Authentication.accessToken =
                                await Authentication.getAccessToken();
                            if (Authentication.accessToken.length >= 50) {
                              homePage();
                            }
                            else{
                             showDialog(
                             context: context,
                        builder: (BuildContext context) {
                                    return AlertDialog(
                           title: const Text("Alert!!"),
                       content: const Text("Wrong pass or user"),
                                 actions: <Widget>[
                                           TextButton(
                                child: const Text("OK"),
                                      onPressed: () {
                                 Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
);
                            }
                          },
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: const Text('login'),
                        ),
                      ),
                    ),
           
          ],
        ));
  }
}
class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page',textAlign: TextAlign.center), 
        leading: IconButton(
          icon: const Icon(Icons.logout), onPressed: () {           
             Navigator.push(
            context,
    MaterialPageRoute(builder: (context) => const MyApp())
    );
    },

        ),
      ),
     body: Center(  
              child: Column(children: <Widget>[  
                Container(  
                  margin: const EdgeInsets.all(20),  
                  child: Table(  
                    defaultColumnWidth: const FixedColumnWidth(120.0),  
                    border: TableBorder.all(  
                        color: Colors.black,  
                        style: BorderStyle.solid,  
                        width: 2),  
                    children: [  
                      TableRow( children: [  
                        Column(children:const [Text('Name', style: TextStyle(fontSize: 30.0))]),  
                        Column(children:const [Text('Job', style: TextStyle(fontSize: 30.0))]),  
                        Column(children:const [Text('Age', style: TextStyle(fontSize: 30.0))]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:const [Text('Ali')]),  
                        Column(children:const [Text('Developer')]),  
                        Column(children:const [Text('27')]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:const [Text('Hassan')]),  
                        Column(children:const [Text('Debuger')]),  
                        Column(children:const [Text('26')]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:const [Text('Hussian')]),  
                        Column(children:const [Text('Infromation Security')]),  
                        Column(children:const [Text('28')]),  
                      ]),  
                    ],  
                  ),  
                ),  
              ])  
          ),
      
    );
  }
}

