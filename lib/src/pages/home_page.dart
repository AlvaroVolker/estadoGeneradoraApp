import 'dart:ui';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:estadogeneradoraapp/src/pages/mainbarchart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<HomePage> {

  static final Config config = new Config("6be806cd-f6f6-4b43-a806-81f0012743f9", "b4d0e974-cc94-4f53-beb0-e27b82b7eb3d", "", "https://consolaoperacionesdev.azurewebsites.net/.auth/login/aad/callback");
  final AadOAuth oAuth = AadOAuth(config);

  @override
  Widget build(BuildContext context) {

    //adjust window size for login
    var screenSize = MediaQuery.of(context).size;
    var rectSize = Rect.fromLTWH(0.0, 25.0, screenSize.width, screenSize.height-25);
    oAuth.setWebViewScreenSize(rectSize);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Container(
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: _crearBottomBar(),
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

  Widget _crearBottomBar() {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _bottomAction(FontAwesomeIcons.home),
          _bottomAction(FontAwesomeIcons.heart),
          _bottomAction(FontAwesomeIcons.chartBar),
          _bottomAction(FontAwesomeIcons.cog),
        ],
      ),
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

  // Widget _textGeneration() {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: <Widget>[
  //             Column(
  //               children: <Widget>[
  //                 Text(
  //                   "Entregando",
  //                   style: TextStyle(fontWeight: FontWeight.w300),
  //                   textAlign: TextAlign.start,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(3.0),
  //                   child: Row(
  //                     children: <Widget>[
  //                       Text('2270,80',
  //                           style: TextStyle(
  //                               color: Colors.black,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 20)),
  //                       Text(
  //                         ' MWh',
  //                         style: TextStyle(color: Colors.grey),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 30,
  //                 ),
  //                 Text(
  //                   'Capacidad',
  //                   textAlign: TextAlign.right,
  //                   style: TextStyle(fontWeight: FontWeight.w300),
  //                 ),
  //                 Row(
  //                   children: <Widget>[
  //                     Text('11233',
  //                         style: TextStyle(
  //                             color: Colors.black,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 20)),
  //                     Text(
  //                       ' MWh',
  //                       style: TextStyle(color: Colors.grey),
  //                     )
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _containerGeneration() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: new Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Container(
                width: 270,
                height: 270,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child:
                          Container(child: MainBarChart()),
                    ),
                    // Expanded(
                    //   child:
                    //       Container(width: 250,child: _textGeneration()),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
