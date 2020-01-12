import 'dart:ui';
import 'package:estadogeneradoraapp/src/pages/content/bottomnavbar_homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'content/homepage/radialcirclechart_homepage.dart';

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
      theme: ThemeData.light(),
      home: Container(
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: BottomNavBar(),
        ),
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            _crearAppBar(),
            _pagesNavigation(),
            _containerGeneration()
          ],
        ),
      ),
    );
  }

  Widget _crearAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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

  Widget _pagesNavigation() {
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(children: <Widget>[
                  Text('Generación',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 27)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 8),
                    child: Text('Favoritos',
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _textGeneration() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "Entregando",
              style: TextStyle(fontWeight: FontWeight.w300),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: <Widget>[
                  Text('2270,80',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Text(
                    ' MWh',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Capacidad',
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Row(
              children: <Widget>[
                Text('11233',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Text(
                  ' MWh',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _containerGeneration() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: new Row(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(
                  height: 240,
                  width: 190,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: RadialCircleChart(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, right: 10),
                    child: _textGeneration(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


