import 'package:flutter/material.dart';

class Palette {
  static const int _primaryColor = 0xFF000000; //#F39C12

  static const primary = Color(0xFFf5ad47);
  static const secondary = Color(0xFF343131);
  static const black2 = Color(0xFF263238);
  static const gray1 = Color(0xFF999999);
  static const gray2 = Color(0xFFEBEBEB);
  static const gray3 = Color(0xFFF0F0F0);
  static const gray4 = Color(0xFFF5F5F5);
  static const gray5 = Color(0xFFCECECE);
  static const success = Color(0xFF28CB85);
  static const dang = Color(0xFFFF5533);
  static const link = Color(0xFF3774E4);
  static const orange = Color(0xFFFF9452);
  static const yellow = Color(0xFFEEC000);
  static const green = Color(0xFF31D0AA);
  static const red = Color(0xFFFF5A4E);
  static const red1 = Color(0xFFFF5652);

  static const backgroundColor = secondary;

  static const primaryColorSwatch = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFFEF5E7), // #FEF5E7
      100: Color(0xFFFDEBD0), //#FDEBD0
      200: Color(0xFFFAD7A0), // #FAD7A0
      300: Color(0xFFF8C471), // #F8C471
      400: Color(0xFFF5B041), // F5B041
      500: Color(_primaryColor),
      600: Color(0xFFD68910), // #D68910
      700: Color(0xFFB9770E), // #B9770E
      800: Color(0xFF9C640C), // #9C640C
      900: Color(0xFF7E5109) // #7E5109
    },
  );
}