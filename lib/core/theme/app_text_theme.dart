import 'package:flutter/material.dart';

import 'palette.dart';

class AppTextTheme {
  final String language;

  AppTextTheme({required this.language});

  TextTheme get reasonableFont {
    return language == 'ar' ? AppTextTheme.arNormal : AppTextTheme.enNormal;
  }

  static TextTheme get enNormal {
    return const TextTheme(
      headline3: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 25,
          fontWeight: FontWeight.w700,
          letterSpacing: 0),
      headline4: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: 0),
      headline5: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0),
      headline6: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.15),
      subtitle1: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15),
      subtitle2: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1),
      bodyText1: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5),
      bodyText2: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25),
      caption: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4),
      button: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.75),
      overline: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5),
    );
  }

  static TextTheme get arNormal {
    return const TextTheme(
      headline3: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 25,
          fontWeight: FontWeight.w700,
          letterSpacing: 0),
      headline4: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: 0),
      headline5: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0),
      headline6: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.15),
      subtitle1: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15),
      subtitle2: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1),
      bodyText1: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5),
      bodyText2: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25),
      caption: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4),
      button: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.75),
      overline: TextStyle(
          fontStyle: FontStyle.normal,
          color: Palette.primary,
          fontFamily: 'Almarai',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5),
    );
  }
}
