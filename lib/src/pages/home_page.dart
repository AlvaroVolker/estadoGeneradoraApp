import 'dart:async';
import 'dart:ui';
import 'package:estadogeneradoraapp/src/providers/detalleGeneracionSBU.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
//import 'package:estadogeneradoraapp/src/pages/mainbarchart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<HomePage> {
  Timer timer;

  Future datos;

  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(
        new Duration(minutes: 1), (t) => datos = _getData());
  }


  _getData() async {
    return await detalleGeneracion.getData();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  static final Config config = new Config(
      "6be806cd-f6f6-4b43-a806-81f0012743f9",
      "b4d0e974-cc94-4f53-beb0-e27b82b7eb3d",
      "",
      "https://consolaoperacionesdev.azurewebsites.net/.auth/login/aad/callback");
  final AadOAuth oAuth = AadOAuth(config);

  @override
  Widget build(BuildContext context) {
    //adjust window size for login
    var screenSize = MediaQuery.of(context).size;
    var rectSize =
        Rect.fromLTWH(0.0, 25.0, screenSize.width, screenSize.height - 25);
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
      color: Colors.white,
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
                  Text('generación',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 27)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 8),
                    child: Text('favoritos',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _progressIndicator() {
    return new CircularPercentIndicator(
        center: Text(
          '59%',
          style: TextStyle(
              color: Color.fromRGBO(36, 102, 13, 1),
              fontSize: 27,
              fontWeight: FontWeight.bold),
        ),
        radius: 120,
        percent: 0.59,
        animation: true,
        backgroundColor: Color.fromRGBO(236, 236, 236, 1),
        lineWidth: 13,
        progressColor: Color.fromRGBO(36, 102, 13, 1));
  }

  Widget _containerGeneration() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: _progressIndicator(),
            )),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: _dataGeneration(),
          )),
        ],
      ),
    );
  }

  Widget _dataGeneration() {
    return FutureBuilder(
      future: datos,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Icon(Icons.mood_bad);
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Icon(Icons.watch_later);
          case ConnectionState.done:
          return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "entregando",
                    style: TextStyle(fontWeight: FontWeight.w300),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Text(snapshot.data.generacionActual.toString(),
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
                    'capacidad',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Row(
                    children: <Widget>[
                      Text(snapshot.data.capacidadInstalada.toString(),
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
          ),
        ],
      ),
    );
          default:
            return Text('default');
        }
      }
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
