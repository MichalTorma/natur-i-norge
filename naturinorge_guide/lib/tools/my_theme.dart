import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

NeumorphicThemeData lightTheme = NeumorphicThemeData(
    baseColor: Color(0xFFFFFFFF),
    lightSource: LightSource.topLeft,
    depth: 10,
    accentColor: Colors.green);

NeumorphicThemeData darkTheme = NeumorphicThemeData(
  baseColor: Color(0xFF3E3E3E),
  lightSource: LightSource.topLeft,
  textTheme: TextTheme(),
  depth: 6,
);
