import 'package:flutter/material.dart';
import 'package:projrct/pages/LoginPage.dart';
import 'package:projrct/pages/cart_page.dart';
import 'package:projrct/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projrct/utils/routes.dart';
import 'package:projrct/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // theme: ThemeData(
      // primarySwatch: Colors.deepOrange,
      // fontFamily: GoogleFonts.lato().fontFamily,
      // appBarTheme: AppBarTheme(
      // color : Colors.white,
      // elevation: 2.0,
      // iconTheme: IconThemeData(color: Colors.black),
      // textTheme: Theme.of(context).textTheme,
      // )
      // ),

      // darkTheme: ThemeData(
      // brightness: Brightness.dark,
      // ),

      debugShowCheckedModeBanner: false,

      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.loginRoute: (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cart: (context) => CartPage(),
      },
    );
  }
}
