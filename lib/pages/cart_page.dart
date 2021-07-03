import 'package:flutter/material.dart';
import 'package:projrct/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget{
  @override
  Widget build (BuildContext context){

    return Scaffold(
      backgroundColor: MyTheme.colorCream,
      appBar: AppBar(
        elevation : 0,
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
    );
  }
}