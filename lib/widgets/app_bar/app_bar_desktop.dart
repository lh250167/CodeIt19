import 'package:flutter/material.dart';
import 'package:shopper_buddy/views/total_view.dart';
import 'package:shopper_buddy/widgets/transitions/SlideRightRoute.dart';

class AppBarDesktop extends StatelessWidget {
  final Color backgroundColor = Colors.lightBlue;
  Text title;
  AppBarDesktop(
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
          SizedBox(width: 10),
          GestureDetector(
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
              ))
        ],
      ),
    ));
  }
}
