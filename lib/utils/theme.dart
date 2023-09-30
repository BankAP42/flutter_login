import 'package:flutter/material.dart';

import 'colors.dart';

var defaultAppTheme = ThemeData(
    fontFamily: 'prompt',
    appBarTheme: const AppBarTheme(
        color: bgColor,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'prompt',
            fontWeight: FontWeight.w500,
            color: primaryBlue),
        centerTitle: true),
    scaffoldBackgroundColor: bgColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 15, color: accentGrey),
      bodyLarge: TextStyle(fontSize: 15, color: accentGrey),
    ));
