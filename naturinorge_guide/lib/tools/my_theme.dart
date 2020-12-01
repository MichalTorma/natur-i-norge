import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

ThemeData myTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Colors.lightGreen[800],
  primaryColorDark: Colors.lightGreen[800],
  primaryColorLight: Colors.lightGreen[100],
  accentColor: Colors.orangeAccent[600],

  // Define the default font family.
  fontFamily: 'Georgia',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
    title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);

NeumorphicThemeData lightTheme = NeumorphicThemeData(
  baseColor: Color(0xFFFFFFFF),
  lightSource: LightSource.topLeft,
  depth: 10,
);

NeumorphicThemeData darkTheme = NeumorphicThemeData(
  baseColor: Color(0xFF3E3E3E),
  lightSource: LightSource.topLeft,
  depth: 6,
);
