import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shopper_buddy/widgets/voice_recognition/voice_recognition_desktop.dart';
import 'package:shopper_buddy/widgets/voice_recognition/voice_recognition_mobile.dart';

import 'app_bar/app_bar_desktop.dart';
import 'app_bar/app_bar_mobile.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.lightBlue;
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;

  /// you can add more fields that meet your needs

  const BaseAppBar({Key key, this.title, this.appBar, this.widgets})
      : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: ScreenTypeLayout(
            mobile: AppBarMobile(context, key, title),
            desktop: AppBarDesktop(context, key, title)),
        backgroundColor: backgroundColor,
        actionsIconTheme:
            IconThemeData(color: Colors.red, opacity: 1, size: 150.0),
        actions: <Widget>[],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: Container(
              width: 800,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ScreenTypeLayout(
                  mobile: MobileVoiceHome(),
                  desktop: DesktopVoiceHome(),
                ),
              ),
            )));
  }
}
