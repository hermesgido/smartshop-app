import 'package:auth_app/features/authentication/controllers/colorss.dart';
import 'package:auth_app/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ThemeData.light()
        .colorScheme
        .copyWith(secondary: secondaryColorLightTheme),
    textTheme: const TextTheme(
      displayMedium: TextStyle(color: textColorLightTheme),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: bgColorDarkTheme,
    colorScheme: ThemeData.light().colorScheme.copyWith(
        secondary: secondaryColorDarkTheme, brightness: Brightness.dark),
    textTheme: const TextTheme(
      displayMedium: TextStyle(color: textColorDarkTheme),
    ),
  );
}
