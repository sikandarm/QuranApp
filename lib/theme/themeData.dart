import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  // Define your primary and accent colors, typography, etc. here
  // scaffoldBackgroundColor: Color.fromARGB(34, 158, 158, 158),
  cardTheme: CardTheme(
    //   color: Color.fromARGB(45, 158, 158, 158),
    // color: Color.fromARGB(
    //   0xff,
    //   0x9b, // red value
    //   0x5f, // green value
    //   0x4d, // blue value
    // ),

    //  color: Colors.black,
    // Define card-specific properties here
    elevation: 3, // Example elevation
    margin: const EdgeInsets.all(8), // Example margin
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Example border radius
    ),
    // You can define more properties such as color, shadowColor, etc. here
  ),
  appBarTheme: const AppBarTheme(
    // Define AppBar-specific properties here
    color: Colors.amber, // Example AppBar background color
    elevation: 0, // Example elevation
    centerTitle: true, // Example center title
    // You can define more properties such as brightness, iconTheme, textTheme, etc. here
  ),
);
