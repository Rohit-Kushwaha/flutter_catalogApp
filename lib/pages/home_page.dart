import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Rohit = "catalog";

    return Scaffold(
      appBar: AppBar(
          title: Text("Catalog App")),
      body: Center(
        child: Container(
            child: Text("Welcome To My $Rohit App")
        ),
      ),
      drawer: Drawer(),
    );
  }
}
