import 'package:flutter/material.dart';
import 'package:startup_namer/theme_settings.dart';

getTheme() {
  return ThemeData(
// Define the default brightness and colors.
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: accentColor,

// Define the default font family.
    fontFamily: fontFamily,

// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline:
          TextStyle(fontSize: headlineFontSize, fontWeight: headlineFontWeight),
      title: TextStyle(fontSize: titleFontSize, fontStyle: titleFontStyle),
      body1: TextStyle(fontSize: body1FontSize, fontFamily: body1FontFamily),
    ),
  );
}
