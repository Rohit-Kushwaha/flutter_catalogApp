import 'package:flutter/material.dart';
import 'dart:convert';

class Item {
  final int id;
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

  factory Item.fromMap(Map<String,dynamic> map){
     return Item(
       id: map["id"],
       name: map["name"],
       desc: map["desc"],
       price: map["price"],
       color: map["color"],
       image: map["image"],
     );
  }

  toMap() => {
    'id' : id,
    'name' : name,
    'desc' : desc,
    'price' : price,
    'color' : color,
    'image' : image,
  };
}

class Catalog {
  static List<Item> items;
  // = [
  //   Item(
  //     id: 1,
  //     name: "iphone",
  //     desc: "iphone 12 Pro max",
  //     price: 900,
  //     color: "#554884",
  //     image:
  //         "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80",
  //   )
  // ];

}
