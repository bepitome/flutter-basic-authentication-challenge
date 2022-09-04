import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  final Map<String, String> _authData = {
    'userName': '',
    'password': '',
  };

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'An Error Occurred!',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Okay'),
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authData['userName'] == null ||
          _authData['userName'] == '' ||
          _authData['password'] == null ||
          _authData['password'] == '') {
        _showErrorDialog('Please fill all mandatory information');
        setState(() {
          _isLoading = false;
        });
        return;
      }
      await Provider.of<Auth>(context, listen: false).login(
        _authData['userName']!,
        _authData['password']!,
      );
    } on HttpException catch (error) {
      _showErrorDialog(error.message);
    } catch (error) {
      const errorMessage =
          'could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Container(
          height: 210,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
            ),
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                color: Colors.black26,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'User Name'),
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    _authData['userName'] = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                const SizedBox(height: 10),
                if (_isLoading)
                  const CircularProgressIndicator()
                else ...[
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8.0),
                      textStyle: TextStyle(
                        color:
                            Theme.of(context).buttonTheme.colorScheme?.primary,
                      ),
                    ),
                    child: const Text('LOGIN'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
