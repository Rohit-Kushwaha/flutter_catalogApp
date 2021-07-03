import 'package:flutter/material.dart';
import 'package:projrct/model/catalog.dart';
import 'package:projrct/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // shadowColor: MyTheme.colorCream,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: "Add To Cart".text.make(),
            ).wh(115, 50),
          ],
        ).p16(),
      ),

      body: SafeArea(
        // bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()), // transition effect
                child: Image.network(catalog.image)
            ).h32(context),
            Expanded(child: VxArc( // VxArc gives arc   // Expanded gives a box
              height: 27,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth, // for fitting the size
                color: context.cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(context.accentColor).bold.make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    "lajdflj kdfjldjfl ksjfl jsl kljfl jas;fljfljdsl jdfkljla  lkjlfk jflj lfldjlkj fklakjfkjid lkjlkjlkj kfjdjflkjo kjfjlfj jlkjgoi kjdaj kj gijl j kjlkjoj lkijijoijij k oi joij oigj  kfjlj l "
                        .text.textStyle(context.captionStyle).make().p16(),
                  ],
                ).py64(),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
