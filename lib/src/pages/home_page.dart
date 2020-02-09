import 'dart:async';
import 'dart:ui';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../providers/generacionSBUProvider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<HomePage> {
  static final Config config = new Config(
      "6be806cd-f6f6-4b43-a806-81f0012743f9",
      "b4d0e974-cc94-4f53-beb0-e27b82b7eb3d",
      "",
      "https://consolaoperacionesdev.azurewebsites.net/.auth/login/aad/callback");

  Future datos;
  final AadOAuth oAuth = AadOAuth(config);
  Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    datos = _getData();
  }

  @override
  Widget build(BuildContext context) {
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

  _getData() async {
    return await detalleGeneracion.getData();
  }

  Widget _body() {
    return FutureBuilder(
        future: datos,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return SafeArea(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _crearAppBar(),
                    _pagesNavigation(),
                    _containerGeneration(snapshot),
                    _listCountry(snapshot),
                    _cardActualizacion(snapshot)
                  ],
                ),
              ),
            );
          }
          return Center(
              child:
                  LinearProgressIndicator(backgroundColor: Colors.deepPurple));
        });
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
                padding: const EdgeInsets.only(left: 20, top: 12),
                child: Row(children: <Widget>[
                  Text('Generación',
                      style: TextStyle(
                          color: Colors.black87,
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

  Widget _containerGeneration(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.only(top: 37),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: _progressIndicator(snapshot),
            )),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: _dataGeneration(snapshot),
          )),
        ],
      ),
    );
  }

  Widget _progressIndicator(AsyncSnapshot snapshot) {
    return new CircularPercentIndicator(
        animateFromLastPercent: true,
        startAngle: 0,
        center: Text(
          " " + snapshot.data.capacidadUsada + "%",
          style: TextStyle(
              color: Color.fromRGBO(36, 102, 13, 1),
              fontSize: 27,
              fontWeight: FontWeight.bold),
        ),
        radius: 120,
        percent: double.parse(snapshot.data.capacidadUsada) / 100,
        animation: true,
        backgroundColor: Color.fromRGBO(236, 236, 236, 1),
        lineWidth: 13,
        progressColor: Color.fromRGBO(36, 102, 13, 1));
  }

  Widget _dataGeneration(AsyncSnapshot snapshot) {
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
                              fontSize: 18)),
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
                            fontSize: 18)),
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
    ));
  }

  Widget _listCountry(AsyncSnapshot snapshot) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: ListView.builder(
          itemExtent: 70,
          itemCount: snapshot.data.listaDetalleGeneracion.length,
          itemBuilder: (BuildContext context, int index) {
            var snapshotData = snapshot.data.listaDetalleGeneracion[index];
            var capacUsada = double.parse(snapshotData.capacidadUsada);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Container(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Column(
                          children: <Widget>[
                            LinearPercentIndicator(
                              percent: capacUsada / 100,
                              animation: true,
                              width: MediaQuery.of(context).size.width - 170,
                              linearStrokeCap: LinearStrokeCap.butt,
                              lineHeight: 20,
                              center: Text(
                                snapshotData.nombre,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                              progressColor: setProgressColor(capacUsada),
                              backgroundColor: setBarColor(capacUsada),
                            ),
                          ],
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(double.parse(snapshotData.capacidadUsada) <
                                        50
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up),
                                Text(
                                  snapshotData.capacidadUsada.toString() + "%",
                                  style: TextStyle(
                                      backgroundColor:  setBarColor(double.parse(
                                          snapshotData.capacidadUsada))),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _cardActualizacion(AsyncSnapshot snapshot) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      snapshot.data.fechaActualizacion + " ",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                    Icon(Icons.update, size: 18, color: Colors.grey)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color setProgressColor(double capacidadUsada) {
    if (capacidadUsada < 50) {
      if (capacidadUsada < 10) return Color.fromRGBO(253, 105, 105, 1);
      return Color.fromRGBO(249, 231, 159, 1);
    } else {
      return Color.fromRGBO(36, 102, 13, 1);
    }
  }

  Color setBarColor(double capacidadUsada) {
    if (capacidadUsada < 50) {
      if (capacidadUsada < 10) return Color.fromRGBO(253, 105, 105, 0.1);
      return Color.fromRGBO(249, 231, 159, 0.2);
    } else {
      return Color.fromRGBO(36, 102, 13, 0.1);
    }
  }
}
