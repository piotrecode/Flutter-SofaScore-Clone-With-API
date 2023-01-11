import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.blue,
  fontFamily: 'Roboto',
  canvasColor: const Color(0xFF1867B4),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Hind',
      color: Colors.white,
    ),
  ),
);
