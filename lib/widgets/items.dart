import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projrct/model/catalog.dart';

class ItemWidget extends StatelessWidget{
  final Item item;

  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: StadiumBorder,
      elevation: 6,
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}