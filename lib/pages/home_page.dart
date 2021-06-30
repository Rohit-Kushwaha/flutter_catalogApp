import 'package:flutter/material.dart';
import 'package:projrct/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Rohit = "catalog";

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        //   title: Text("Catalog Apps",
        //     style: TextStyle(
        //         color: Colors.black,),
          ),
              // iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: Center(
        child: Container(
            child: Text("Welcome To My $Rohit App")
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
