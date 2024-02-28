import 'package:flutter/material.dart';

class ThemeHelper {
  static final ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff981A1E),
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.light(
      primary: Colors.deepPurple.shade500, // Color(0xff017457),
      secondary: const Color(0xffD9AC6B),
      background: const Color(0xff545F71),
      brightness: Brightness.light,
      primaryContainer: Colors.deepPurple.shade300,
      secondaryContainer: const Color(0xfff9f2d5),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff181A20),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: ColorScheme.dark(
      background: Colors.white,
      primaryContainer: Colors.deepPurple.shade300,
      secondaryContainer: const Color(0xfff9f2d5),
      primary: Colors.deepPurple.shade500, // Color(0xff017457),
      secondary: Colors.deepPurple.shade300,
      brightness: Brightness.dark,
      // background: Colors.
    ),
  );
}
