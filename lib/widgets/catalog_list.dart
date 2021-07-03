import 'package:flutter/material.dart';
import 'package:projrct/model/catalog.dart';
import 'package:projrct/pages/home_details_page.dart';
import 'package:projrct/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        //because you are trying to use the list in column or for fit space
        itemCount: Catalog.items.length,
        itemBuilder: (context, index) {
          final catalog = Catalog.items[index];
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailsPage(
              catalog: catalog,)
            ),
            ),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(tag: Key(catalog.id.toString()  //for transition
          ),child: CatalogImage(image: catalog.image)), // for image
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // for description
                mainAxisAlignment: MainAxisAlignment.center, // for description
                children: [
                  catalog.name.text.xl.color(context.accentColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    buttonPadding: EdgeInsets.zero,
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(context.theme.buttonColor),
                            shape: MaterialStateProperty.all(StadiumBorder()),
                          ),
                          child: "Add to cart".text.xs.make()),
                    ],
                  ).pOnly(right: 8.0)
                ],
              ))
        ],
      ),
    )
        .color(context.cardColor).rounded.square(150).make().py16();
    // .white.rounded.r
  }
}