import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  progressIndicatorTheme: ProgressIndicatorThemeData(
    circularTrackColor: const Color.fromARGB(
        146, 255, 223, 204), // Color for the background track
    color: Color(0xffff951d31), // Color for the progress indicator itself
  ),
  scaffoldBackgroundColor: Color.fromARGB(34, 158, 158, 158),
  cardTheme: CardTheme(
    color: Color.fromARGB(45, 158, 158, 158),
    elevation: 3,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  // bottomAppBarTheme: BottomAppBarTheme(
  //   color: const Color(0xffffdfcc),
  // ),
  appBarTheme: const AppBarTheme(
    foregroundColor: Color(0xffff951d31),
    titleTextStyle: TextStyle(
      color: Color(0xffffae2138),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    color: Color(0xffffdfcc),
    elevation: 0,
    centerTitle: true,
  ),
);
