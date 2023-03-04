import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: const TextTheme(
          headline2: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          headline4: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
          subtitle2: TextStyle(fontSize: 14, color: Colors.black)));
}
