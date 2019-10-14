import 'package:flutter/material.dart';

getTheme() {
  return ThemeData(
    primaryColor: Colors.orange,
  );
}

getTheme2() {
  return ThemeData(
// Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    accentColor: Colors.cyan[600],

// Define the default font family.
    fontFamily: 'Montserrat',

// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}

getTheme3(brightness, primaryColor, accentColor) {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: accentColor,
  );
}
