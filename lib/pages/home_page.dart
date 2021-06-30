import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projrct/model/catalog.dart';
import 'package:projrct/widgets/drawer.dart';
import 'package:projrct/widgets/items.dart';
import 'dart:convert';

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
    final catalogJson = await rootBundle.loadString("images/files/catalog.json");
    // print(catalogJson); //we cannot map json directly to our model class so we have first of all convert throughdart convery library package
    final jsonDecodeData = jsonDecode(catalogJson); //we have to map our decoded data in our model class
    // print(jsonDecodeData);
    var productsdata = jsonDecodeData["products"];
    Catalog.items = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
    // print(productsdata);
  }

  @override
  Widget build(BuildContext context) {
    var Rohit = "catalog";
    // final dummyList = List.generate(10, (index) => Catalog.items[0]);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text("Catalog Apps"),
        //     style: TextStyle(
        //         color: Colors.black,),
      ),
      // iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: (Catalog.items != null && Catalog.items.isNotEmpty) ?  ListView.builder(
          itemCount: Catalog.items.length,
          // itemCount: Catalog.items.length,
          // itemCount: dummyList.length, // for replicating the images
          itemBuilder: (context, index) {
            return ItemWidget(
              item: Catalog.items[index],
              // item: dummyList[0], // for replicating the images
              // item: Catalog.items[index],
            );
          },
        ):Center(child: CircularProgressIndicator(),
        )
      ),
      // body: center{
      // child: Container(
      //     child: Text("Welcome To My $Rohit App")
      // ),
      // }
      // }
      //   ),
      drawer: MyDrawer(),
    );
  }
}
