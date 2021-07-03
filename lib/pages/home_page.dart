import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projrct/model/catalog.dart';
import 'package:projrct/pages/cart_page.dart';
import 'package:projrct/utils/routes.dart';
import 'package:projrct/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/catalog_header.dart';
import '../widgets/catalog_list.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("images/files/catalog.json");
    // print(catalogJson); //we cannot map json directly to our model class so we have first of all convert throughdart convery library package
    final jsonDecodeData = jsonDecode(catalogJson); //we have to map our decoded data in our model class
    // print(jsonDecodeData);
    var productsdata = jsonDecodeData["products"];
    Catalog.items =
        List.from(productsdata) // Getting product data and send in map format
            .map<Item>((item) => Item.fromMap(item))
            .toList();

    setState(() {});
    // print(productsdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.colorCream,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.pushNamed(context, MyRoutes.cart);
        },
        backgroundColor: MyTheme.darkbluihsCream,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: Vx.m32, //padding from all sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              if (Catalog.items != null && Catalog.items.isNotEmpty)
                CatalogList().expand()  // here we expanded the list that's why we have to expand the progress indicator
              else
                CircularProgressIndicator().centered().expand(), //because we expanded the list that why we have to do this
            ],
          ),
        ),
      ),
    );
  }
}






