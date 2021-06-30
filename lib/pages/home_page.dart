import 'package:flutter/material.dart';
import 'package:projrct/model/catalog.dart';
import 'package:projrct/widgets/drawer.dart';
import 'package:projrct/widgets/items.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Rohit = "catalog";
    final dummyList = List.generate(10, (index) => Catalog.items[0]);

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
        child: ListView.builder(
          // itemCount: Catalog.items.length,
          itemCount: dummyList.length, // for replicating the images
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[0], // for replicating the images
              // item: Catalog.items[index],
            );
          },
        ),
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
