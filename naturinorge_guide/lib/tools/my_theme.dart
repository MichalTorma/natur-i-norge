import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xffeebb02),
    primarySwatch: Colors.blueGrey
    // primaryColorLight: Color(0xffffed4d),
    // primaryColorDark: Color(0xffb78b00),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //         backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[50])))

    // baseColor: Color(0xFFFFFFFF),
    // lightSource: LightSource.topLeft,
    // depth: 10,
    // accentColor: Colors.green,
    );
// <color name="primaryColor">#eebb02</color>
// <color name="primaryLightColor">#ffed4d</color>
// <color name="primaryDarkColor">#b78b00</color>
// <color name="secondaryColor">#fafafa</color>
// <color name="secondaryLightColor">#ffffff</color>
// <color name="secondaryDarkColor">#c7c7c7</color>
// <color name="primaryTextColor">#000000</color>
// <color name="secondaryTextColor">#000000</color
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // baseColor: Color(0xFF3E3E3E),
  // lightSource: LightSource.topLeft,
  textTheme: TextTheme(),
  // depth: 6,
);
