import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: _crearBottomBar(),
        ),
      ),
    );
  }

  Widget _crearBottomBar() {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _bottomAction(FontAwesomeIcons.home),
          _bottomAction(FontAwesomeIcons.heart),
          _bottomAction(FontAwesomeIcons.chartBar),
        ],
      ),
    );
  }

  Widget _crearAppBar() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: CircleAvatar(
            child: Text('SL'),
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(icon),
      ),
      onTap: () {},
    );
  }

  Widget _body() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 17.0, top: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _crearAppBar(),
          ],
        ),
      ),
    );
  }
}
