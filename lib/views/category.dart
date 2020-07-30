import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shopper_buddy/Model/product.dart';
import 'package:shopper_buddy/widgets/base_app_bar.dart';
import 'package:shopper_buddy/widgets/category_content/category_content_desktop.dart';
import 'package:shopper_buddy/widgets/category_content/category_content_mobile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key, this.category, this.productList})
      : super(key: key);

  final String category;
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: BaseAppBar(
          title: Text(category),
          appBar: AppBar(),
          widgets: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Center(
            child: SizedBox(
                // width: double.infinity,
                //height: double.infinity,
                child: ScreenTypeLayout(
          mobile: CategoryContentMobile(context, productList: productList),
          desktop: CategoryContentDesktop(context),
        ))));
  }
}
