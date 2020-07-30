import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shopper_buddy/widgets/base_app_bar.dart';
import 'package:shopper_buddy/widgets/home_content/home_content_desktop.dart';
import 'package:shopper_buddy/widgets/home_content/home_content_mobile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text(title),
          appBar: AppBar(),
          widgets: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ScreenTypeLayout(
              mobile: HomeContentMobile(context),
              desktop: HomeContentDesktop(context),
            ),
          ),
        ));
  }
}
