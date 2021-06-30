import 'package:flutter/material.dart';

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {this.id,
      this.name,
      this.desc,
      this.price,
      this.color,
      this.image}); //named Constructor

}

class Catalog {
  static final items = [
    Item(
      id: "phone1",
      name: "iphone",
      desc: "iphone 12 Pro max",
      price: 90000,
      color: "#554884",
      image:
          "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80",
    )
  ];
}
