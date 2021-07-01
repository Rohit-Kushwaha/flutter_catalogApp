import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projrct/model/catalog.dart';
import 'package:projrct/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

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
    return Scaffold(
      backgroundColor: MyTheme.colorCream,
      body: SafeArea(
        child: Container(
          padding: Vx.m32, //padding from all sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              if (Catalog.items != null && Catalog.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

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

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        //because you are trying to use the list in column or for fit space
        itemCount: Catalog.items.length,
        itemBuilder: (context, index) {
          final catalog = Catalog.items[index];
          return CatalogItem(catalog: catalog);
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
          CatalogImage(image: catalog.image),
          Expanded(
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               catalog.name.text.xl.color(Colors.black87).bold.make(),
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
                            MaterialStateProperty.all(MyTheme.darkbluihsCream),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                      child: "Buy".text.make()),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    )
        .white.rounded.square(125).make().py16();
    // .white.rounded.r
  }
}

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
