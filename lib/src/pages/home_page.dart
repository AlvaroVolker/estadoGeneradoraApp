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
        name: "Inicio",
        colorLineSelected: Colors.white60,
        baseStyle: TextStyle(
            color: Colors.white24, fontSize: 25.0, fontFamily: 'OpenSans'),
        selectedStyle: TextStyle(color: Colors.white60, fontFamily: 'OpenSans'),
      ),
      SBUPage(),
    ));

    items.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Other",
        colorLineSelected: Colors.white60,
        baseStyle: TextStyle(
            color: Colors.white24, fontSize: 25.0, fontFamily: 'OpenSans'),
        selectedStyle: TextStyle(color: Colors.white60, fontFamily: 'OpenSans'),
      ),
      BadRequestWidget(),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Color.fromRGBO(13, 1, 31, 1),
      backgroundColorAppBar: Theme.of(context).accentIconTheme.color,
      elevationAppBar: 0,
      iconMenuAppBar: Icon(FontAwesomeIcons.gripLines, color: Colors.black),
      screens: items,
      slidePercent: 60.0,
      contentCornerRadius: 40.0,
    );
  }
}
