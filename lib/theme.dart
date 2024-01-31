import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: Color(0xfff5f5f5),
    textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.black54),
          ),
    appBarTheme: AppBarTheme(
        color: Color(0xff1f655d),
        actionsIconTheme: IconThemeData(color: Colors.white)));


ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Color(0xff1f655d),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Color(0xff40bf7a)),),
    appBarTheme: AppBarTheme(color: Color(0xff1f655d)));
