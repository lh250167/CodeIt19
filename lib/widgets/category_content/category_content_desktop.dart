import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_details_mobile.dart';

class CategoryContentDesktop extends StatelessWidget {
  CategoryContentDesktop(BuildContext context, {Key key, this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.keyboard_arrow_left,
                          size: 40, color: Colors.white),
                      Text(
                        "Back",
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
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Next",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 0.9,
                              fontSize: 20,
                              color: Colors.white)),
                      Icon(Icons.keyboard_arrow_right,
                          size: 40, color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TableCell(
                    child: ItemDetailsContentMobile(context),
                  )
                ])
          ],
        ));
  }
}
