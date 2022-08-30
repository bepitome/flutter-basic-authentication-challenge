import 'package:basic_authentication_flutter_challenge/src/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Standard view to be used to give the
/// sscreens standard configurations like SafeArea & Padding.
class ViewScaffold extends StatelessWidget {
  final Widget child;

  const ViewScaffold({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: kViewScaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: kMdSpace,
            left: kMdSpace,
            right: kMdSpace,
          ),
          child: child,
        ),
      ),
    );
  }
}
