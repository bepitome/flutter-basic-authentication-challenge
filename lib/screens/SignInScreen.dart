import 'package:basic_authentication_flutter_challenge/components/TextFiledContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../api/api.dart';
import '../components/RoundedInputField.dart';
import 'HomeScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    API.setUsername(_usernameController.text);
    API.setPassword(_passwordController.text);
    // API.setUsername('jarmatage8');
    // API.setPassword('xwNEVYPnI');

    await API.setAccessToken();

    if (API.accessToken.length < 200) {
      return;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        elevation: 0,
        backgroundColor: Colors.indigoAccent[100],
      ),
      backgroundColor: Colors.indigoAccent[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'images/welcomeImage.svg',
                height: 200,
              ),
              const Text(
                'Welcome to the sign in page .',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Column(
                children: [
                  TextFiledContainer(
                    child: RoundedInputFiled(
                      hintText: 'Enter your email',
                      icon: Icon(
                        Icons.email,
                        color: Colors.indigoAccent[100],
                      ),
                      controller: _usernameController,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFiledContainer(
                    child: RoundedInputFiled(
                      hintText: 'Enter your password',
                      icon: Icon(
                        Icons.password,
                        color: Colors.indigoAccent[100],
                      ),
                      controller: _passwordController,
                      isObscure: true,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: GestureDetector(
                  onTap: login,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color(0xFF6C63FF),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
