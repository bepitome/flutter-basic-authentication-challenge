import 'package:basic_authentication_flutter_challenge/src/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class SmallSpace extends StatelessWidget {
  const SmallSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: kSmSpace,
      width: kSmSpace,
    );
  }
}
