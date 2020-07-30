import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopper_buddy/Model/ProductsMocks.dart';

class cart extends StatefulWidget {
  cart(BuildContext context, {Key key, this.title}) : super(key: key);

  final String title;

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 480.0,
      width: 400.0,
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return buildItemCart(context);
          }),
    );
  }

  Widget buildItemCart(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              height: 50,
              color: Colors.green,
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    RaisedButton(
                      child: Text("up"),
                      onPressed: () => {},
                    ),
                    RaisedButton(
                      child: Text("down"),
                      onPressed: () => {},
                    )
                  ]))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "My Order",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .apply(fontWeightDelta: 2, color: Colors.black),
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
                              child: Text(
                                  "X" + " " + "${productsList[id].amount}"),
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
                  Expanded(
                      flex: 2,
                      child: Container(
                          height: 100,
                          width: double.infinity,
                          child: RaisedButton(
                              child: Text(
                                "PAY",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .apply(color: Colors.white),
                              ),
                              onPressed: () {},
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ))))
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
}
