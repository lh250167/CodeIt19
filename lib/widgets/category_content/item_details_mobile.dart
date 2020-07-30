import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopper_buddy/Model/ProductsMocks.dart';
import 'package:shopper_buddy/Model/product.dart';
import 'package:shopper_buddy/views/total_view.dart';
import 'package:shopper_buddy/widgets/transitions/SlideRightRoute.dart';

import 'cart.dart';

class ItemDetailsContentMobile extends StatefulWidget {
  ItemDetailsContentMobile(BuildContext context,
      {Key key, this.title, this.productList})
      : super(key: key);

  final String title;
  final List<Product> productList;

  @override
  _ItemDetailsContentMobileState createState() =>
      _ItemDetailsContentMobileState();
}

class _ItemDetailsContentMobileState extends State<ItemDetailsContentMobile> {
  final List<ItemDetails> itemsDetails = new List<ItemDetails>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: 300.0,
          width: 350.0,
          child: ListView.builder(
              itemCount: widget.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return buildItemCart(context, widget.productList, index);
              }),
        ));
  }

  OverlayEntry overlayEntry;

  showCart() async {
    if (overlayEntry != null) return;
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 50,
          right: 20,
          child: SizedBox(
            width: 300,
            height: 600,
            child: buildCart(context),
          ),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
    await Future.delayed(Duration(seconds: 5));
    overlayEntry.remove();
    overlayEntry = null;
  }

  Widget buildItemCart(
      BuildContext context, List<Product> productsList, int index) {
    return Card(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset("${productsList[index].imageUrl}",
                    height: 100, width: 100),
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Text("${productsList[index].name}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0))
                ]),
                Row(
                  children: [
                    Text("Price:",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0))
                  ],
                ),
                Row(
                  children: [
                    Text(
                        "${productsList[index].price}" +
                            "${productsList[index].currency}",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0))
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/speaker.png",
                        height: 50.0, width: 100.0)
                  ],
                ),
                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                      color: getColor(index),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () => showCart(),
                          child: Text("Add",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  height: 0.9,
                                  fontSize: 12,
                                  color: Colors.white))),
                    ],
                  ),
                )
              ],
            ),
          ]),
    );
  }
}

Widget buildCart(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 0,
    //color: Colors.lightGreenAccent,

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            height: 50,
            child: GestureDetector(
                onTap: () => Navigator.push(
                      context,
                      SlideRightRoute(widget: TotalScreen(title: "Total")),
                    ),
                child: Container(
                  width: 65,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Pay",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 0.9,
                              fontSize: 14,
                              color: Colors.white)),
                      Icon(Icons.payment, size: 20, color: Colors.white),
                    ],
                  ),
                ))),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("My Order", style: Theme.of(context).textTheme.display1
                    //.apply(fontWeightDelta: 2, color: Colors.black),
                    ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ...List.generate(productsList.length, (id) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              "${productsList[id].imageUrl}",
                              width: 70,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: Text(
                            "${productsList[id].name}",
                            style: Theme.of(context).textTheme.title,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                            ),
                            child:
                                Text("X" + " " + "${productsList[id].amount}"),
                          ),
                          trailing: Text(
                            "${productsList[id].currency}" +
                                "${productsList[id].price}",
                            style: Theme.of(context).textTheme.title,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "Total",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .apply(fontWeightDelta: 2, color: Colors.black),
                    )),
                    Expanded(
                        child: Text(
                      "${productsList[0].currency}" + getTotalAmount(),
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .apply(fontWeightDelta: 2, color: Colors.black),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

String getTotalAmount() {
  double sum = 0;
  productsList.forEach((element) {
    sum += element.price;
  });
  sum = roundDouble(sum, 2);
  return sum.toStringAsFixed(2);
}

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

Color getColor(int index) {
  if (index == 0) return Colors.blue;
  if (index == 1) return Colors.green;
  if (index == 2) return Colors.orange;
  return Colors.black;
}

class ItemDetails {
  String name;
  String imageUrl;
  Price price;
}

class Price {
  String amount;
  String currency;
}
