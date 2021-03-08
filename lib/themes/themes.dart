import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    accentColor: Colors.black,
    textTheme: GoogleFonts.poppinsTextTheme()
        .apply(bodyColor: Colors.black, displayColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    accentColor: Colors.white,
    cardTheme: CardTheme(color: Colors.black),
    textTheme: GoogleFonts.poppinsTextTheme()
        .apply(bodyColor: Colors.white60, displayColor: Colors.white60),
    scaffoldBackgroundColor: Color.fromRGBO(22, 22, 22, 1),
  );
  //scaffoldBackgroundColor: Colors.black);
}
