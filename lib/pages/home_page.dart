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
    final catalogJson =
        await rootBundle.loadString("images/files/catalog.json");
    // print(catalogJson); //we cannot map json directly to our model class so we have first of all convert throughdart convery library package
    final jsonDecodeData = jsonDecode(
        catalogJson); //we have to map our decoded data in our model class
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
          child: (Catalog.items != null && Catalog.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    final item = Catalog.items[index];

                    return Card(
                        clipBehavior: Clip.antiAlias, // for corners
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),

                        child: GridTile(

                            header: Container(
                              child: Text(
                                item.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: const EdgeInsets.all(10),
                              // because of fix values so the compiler does not draw again and again
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                              ),
                            ),

                            child: Image.network(item.image),

                            footer: Container(
                              child: Text(
                                item.name,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              padding: const EdgeInsets.all(10),
                              // because of fix values so the compiler does not draw again and again
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                              ),
                              //
                            )));
                  },
                  itemCount: Catalog.items.length)
              : Center(
                  child: CircularProgressIndicator(),
                )),

      // itemCount: Catalog.items.length,  // 4 lines are just for listview display
      // itemBuilder: (context, index) {
      //   return ItemWidget(
      //     item: Catalog.items[index],

      // itemCount: Catalog.items.length,
      // itemCount: dummyList.length, // for replicating the images

      // item: dummyList[0], // for replicating the images
      // item: Catalog.items[index],
      // )
      // },

      // )
      // ),

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
