import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: colorCream,
    buttonColor: darkbluihsCream,
        accentColor: darkbluihsCream,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          // elevation: 2.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.black,
      canvasColor: darkbluihsCream,
      buttonColor: lightbluihsCream,
      accentColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        // elevation: 2.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme,
      )
  );

  static Color colorCream = Color(0xfff5f5f5);
  static Color darkcolorCream = Vx.gray900;
  static Color darkbluihsCream = Color(0xff403b58);
  static Color lightbluihsCream = Vx.indigo500;
}
