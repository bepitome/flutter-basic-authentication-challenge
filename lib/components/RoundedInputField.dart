import 'package:flutter/material.dart';

class RoundedInputFiled extends StatelessWidget {
  const RoundedInputFiled({
    Key? key, required this.controller, required this.hintText, required this.icon, this.isObscure = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Icon icon; 
  final isObscure ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        icon: icon , 
        hintText: hintText,
        border: InputBorder.none,
      ),
      controller: controller,
    );
  }
}
