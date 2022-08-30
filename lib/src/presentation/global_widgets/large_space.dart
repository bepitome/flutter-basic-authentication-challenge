import 'package:basic_authentication_flutter_challenge/src/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class LargeSpace extends StatelessWidget {
  const LargeSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: kLgSpace,
      width: kLgSpace,
    );
  }
}
