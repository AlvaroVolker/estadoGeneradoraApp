import 'dart:ui';
import 'package:estadogeneradoraapp/src/pages/sbu_page.dart';
import 'package:estadogeneradoraapp/src/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<HomePage> with TickerProviderStateMixin {
  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Home",
        colorLineSelected: Colors.blueGrey,
        baseStyle:
            TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 25.0),
        selectedStyle: TextStyle(color: Colors.blueGrey),
      ),
      SBUPage(),
    ));

    items.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Other",
        colorLineSelected: Colors.orange,
        baseStyle:
            TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 25.0),
        selectedStyle: TextStyle(color: Colors.orange),
      ),
      BadRequestWidget(),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepPurple.withOpacity(0.5),
      backgroundColorAppBar: Colors.white70,
      elevationAppBar: 0,
      iconMenuAppBar: Icon(FontAwesomeIcons.gripLines, color: Colors.black),
      screens: items,
      slidePercent: 60.0,
      contentCornerRadius: 40.0,
    );
  }
}
