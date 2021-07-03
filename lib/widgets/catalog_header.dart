import 'package:flutter/material.dart';
import 'package:projrct/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App".text.xl5.bold.color(MyTheme.darkbluihsCream).make(),
      // like Text("");
      "Trending Products".text.xl2.make(),
    ]);
  }
}