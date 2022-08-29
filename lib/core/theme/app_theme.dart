import 'package:basic_auth_challenge/core/theme/palette.dart';
import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class AppTheme
{
  ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Palette.primaryColorSwatch,
      primaryColor: Palette.primary,
      errorColor: Palette.dang,
      dividerColor: Palette.gray3,
      colorScheme: AppColorScheme.light,
      scaffoldBackgroundColor: Palette.backgroundColor,
      appBarTheme: appBarTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme:  AppTextTheme(language: 'en').reasonableFont,
    );
  }

  AppBarTheme get appBarTheme {
    return AppBarTheme(
      titleTextStyle: AppTextTheme(language: 'en').reasonableFont.headline6,
      backgroundColor: Palette.secondary,
      elevation: 1,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Palette.primaryColorSwatch,
      ),
    );
  }
}

mixin AppColorScheme {
  static const ColorScheme light = ColorScheme(
      primary: Palette.primary,
      secondary: Palette.secondary,
      surface: Palette.secondary,
      background: Palette.secondary,
      error: Palette.dang,
      onPrimary: Palette.secondary,
      onSecondary: Palette.primary,
      onSurface: Palette.secondary,
      onBackground: Palette.primary,
      onError: Palette.secondary,
      brightness: Brightness.light);
}