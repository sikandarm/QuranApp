import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
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
