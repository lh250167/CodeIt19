import 'package:flutter/material.dart';
import 'package:shopper_buddy/Model/ProductsMocks.dart';
import 'package:shopper_buddy/Model/product.dart';
import 'package:shopper_buddy/views/category.dart';
import 'package:shopper_buddy/widgets/transitions/SlideRightRoute.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile(BuildContext context, {Key key, this.title})
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
                  _heightSpacer(),
                  _buildCard('CLEANING', Colors.blue, context)
                ],
              )),
              _widthSpacer(),
              Expanded(
                  child: Column(
                children: [
                  _buildCard('VEGETABLES', Colors.orange, context),
                  _heightSpacer(),
                  _buildCard('DAIRY', Colors.pink, context),
                  _heightSpacer(),
                  _buildCard('MEAT', Colors.green, context)
                ],
              ))
            ],
          ))
        ],
      ),
    );
  }
}

Widget _widthSpacer() {
  return SizedBox(width: 14);
}

Widget _heightSpacer() {
  return SizedBox(height: 14);
}

Widget _buildCard(String category, Color color, BuildContext context) {
  return SizedBox(
    height: 110,
    child: Card(
      color: color,
      child: InkWell(
        onTap: () {
          List<Product> products = getCategoryProducts(category);
          Navigator.push(
            context,
            SlideRightRoute(
                widget: CategoryScreen(
              category: category,
              productList: products,
            )),
          );
        },
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/' + category.toLowerCase() + '.png',
                  height: 70,
                  width: double.infinity,
                  fit: BoxFit.scaleDown,
                )),
            Expanded(
                child: ListTile(
              title: new Center(
                child: Text(category,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        height: 0.9,
                        fontSize: 18,
                        color: Colors.white)),
              ),
            ))
          ],
        ),
      ),
    ),
  );
}

Route _createRoute(String category, BuildContext context) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CategoryScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

List<Product> getCategoryProducts(String category) {
  var categoryProducts = new List<Product>();
  for (var i = 0; i < productsList.length; i++) {
    if (productsList[i].category.name.toLowerCase() == category.toLowerCase()) {
      categoryProducts.add(productsList[i]);
    }
  }
  return categoryProducts;
}
