import 'package:flutter/material.dart';
import 'package:projrct/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.p8.rounded.color(MyTheme.colorCream).make().p8();
    // .wHalf(context),
  }
}