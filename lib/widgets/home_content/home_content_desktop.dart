import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper_buddy/views/category.dart';
import 'package:shopper_buddy/widgets/transitions/SlideRightRoute.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop(BuildContext context, {Key key, this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Column(
                children: [
                  _buildCard('FRUITS', Colors.pink, context),
                  _heightSpacer(),
                  _buildCard('BAKERY', Colors.red, context),
                ],
              )),
              _widthSpacer(),
              Expanded(
                  child: Column(
                children: [
                  _buildCard('VEGETABLES', Colors.orange, context),
                  _heightSpacer(),
                  _buildCard('MEAT', Colors.green, context),
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  _buildCard('DAIRY', Colors.pink, context),
                  _heightSpacer(),
                  _buildCard('CLEANING PRODUCTS', Colors.blue, context),
                ],
              )),
            ],
          ))
        ],
      ),
    );
  }
}

Widget _widthSpacer() {
  return SizedBox(width: 30);
}

Widget _heightSpacer() {
  return SizedBox(height: 30);
}

Widget _buildCard(String category, Color color, BuildContext context) =>
    SizedBox(
      height: 180,
      width: 400,
      child: Card(
          color: color,
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              SlideRightRoute(widget: CategoryScreen(category: category)),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/' + category + '.png',
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.scaleDown,
                  semanticLabel: category,
                ),
                ListTile(
                    onTap: () => _createRoute(category),
                    title: new Center(
                      child: Text(category,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 0.9,
                              fontSize: 20,
                              color: Colors.white)),
                    ))
              ],
            ),
          )),
    );

Route _createRoute(String category) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CategoryScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
