import 'package:flutter/material.dart';
import 'package:shopper_buddy/Model/ProductsMocks.dart';
import 'package:shopper_buddy/views/total_view.dart';
import 'package:shopper_buddy/widgets/category_content/item_details_mobile.dart';
import 'package:shopper_buddy/widgets/transitions/SlideRightRoute.dart';

class AppBarMobile extends StatelessWidget {
  final Color backgroundColor = Colors.lightBlue;
  Text title;
  AppBarMobile(
    BuildContext context,
    Key key,
    Text title,
  ) : super(key: key) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: EdgeInsets.all(16.0),
        child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title,
          SizedBox(width: 10),
          GestureDetector(
              onTap: () =>
                  Navigator.popUntil(context, ModalRoute.withName('/')),
              child: Container(
                width: 65,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Home",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            height: 0.9,
                            fontSize: 14,
                            color: Colors.white)),
                    Icon(Icons.home, size: 20, color: Colors.white),
                  ],
                ),
              )),
          SizedBox(width: 20),
          GestureDetector(
              onTap: () => showCart(context),
              child: Container(
                width: 65,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            height: 0.9,
                            fontSize: 14,
                            color: Colors.white)),
                    Icon(Icons.shopping_cart, size: 20, color: Colors.white),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}

OverlayEntry overlayEntry;

showCart(BuildContext context) async {
  //if (overlayEntry != null) return;
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
