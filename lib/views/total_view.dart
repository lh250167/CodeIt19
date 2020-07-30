import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shopper_buddy/Model/ProductsMocks.dart';
//import 'package:shopper_buddy/widgets/Counter.dart';
import 'package:shopper_buddy/widgets/base_app_bar.dart';
import 'package:shopper_buddy/widgets/home_content/home_content_desktop.dart';
import 'package:shopper_buddy/widgets/home_content/home_content_mobile.dart';
import 'package:shopper_buddy/widgets/transitions/SlideRightRoute.dart';

import 'PaymentDetails.dart';

class TotalScreen extends StatelessWidget {
  const TotalScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: Text(title),
        appBar: AppBar(),
        widgets: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          /*  Container(
              height: 50,
              color: Colors.pink,
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
                  ]))), */
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
                              child: Image.asset(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.keyboard_arrow_up,
                        size: 40, color: Colors.white),
                    Text(
                      "Up",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          height: 0.9,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.keyboard_arrow_down,
                        size: 40, color: Colors.white),
                    Text(
                      "Down",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          height: 0.9,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .apply(fontWeightDelta: 2, color: Colors.black)),
              Text("${productsList[0].currency}" + getTotalAmount(),
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .apply(fontWeightDelta: 2, color: Colors.black))
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: Container(
                    height: 100,
                    width: double.infinity,
                    child: RaisedButton(
                        child: Text(
                          "PAY",
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .apply(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              SlideRightRoute(
                                  widget:
                                      PaymentDetailsScreen(title: "Payment")));
                        },
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )))),
          ])
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
