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
      appBar: AppBar(),
      backgroundColor: MyTheme.colorCream,
      bottomNavigationBar:Container(
        color: Colors.white,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(MyTheme.darkbluihsCream),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                ),
                child: "Buy".text.xl.make(),
            ).wh(100, 30),
          ],
        ).p32(),
      ),

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context).py16(),
            Expanded(child : VxArc(  // VxArc gives arc   // Expanded gives a box
             height: 27,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width : context.screenWidth, // for fitting the size
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(MyTheme.darkbluihsCream).bold.make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
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
