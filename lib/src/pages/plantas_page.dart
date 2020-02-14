import 'dart:async';
import 'package:estadogeneradoraapp/src/providers/plantaProvider.dart';
import 'package:estadogeneradoraapp/src/widgets/country_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlantaPage extends StatefulWidget {
  @override
  _PlantaPageState createState() => _PlantaPageState();
}

class _PlantaPageState extends State<PlantaPage> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    setState(() {
      _getData();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  _getData() async {
    return await detallePlanta.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
            appBar: _crearAppBar(),
            body: _body(),
            bottomNavigationBar: _crearBottomBar()),
      ),
    );
  }

  Widget _body() {
    return FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return SafeArea(
              child: Center(
                child: Container(
                    child: Column(
                  children: <Widget>[
                    _pagesNavigation(),
                    _containerGeneration(snapshot)
                  ],
                )),
              ),
            );
          }
          return Center(
            child: GradientProgressIndicator(
              gradient: Gradients.cosmicFusion,
            ),
          );
        });
  }

  Widget _crearAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Row(
        children: <Widget>[
          SizedBox(width: 20.0),
          Icon(FontAwesomeIcons.chevronLeft, color: Colors.black38)
        ],
      ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 12),
                  child: Row(children: <Widget>[
                    Text('Plantas',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 29)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Text('máquinas',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400)),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _containerGeneration(AsyncSnapshot snapshot) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: _circular(snapshot),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: _dataGeneration(snapshot),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.0),
            CountryList(snapshot: snapshot)
          ],
        ),
      ),
    );
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
                Container(
                  width: 100,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Entregando",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(snapshot.data.generacionActual.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17)),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            ' MWh',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 100,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Capacidad',
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(snapshot.data.capacidadInstalada.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17)),
                      Text(
                        ' MWh',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }

  Widget _circular(AsyncSnapshot snapshot) {
    final Shader linearGradient = LinearGradient(colors: [
      const Color.fromRGBO(41, 205, 235, 0.5),
      const Color.fromRGBO(158, 112, 255, 0.5),
      const Color.fromRGBO(49, 79, 251, 0.5),
    ]).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return CircularPercentIndicator(
      animationDuration: 2,
      addAutomaticKeepAlive: true,
      animateFromLastPercent: true,
      startAngle: 0,
      center: Text(
        " " + snapshot.data.capacidadUsada + "%",
        style: TextStyle(
            foreground: Paint()..shader = linearGradient,
            fontSize: 27,
            fontWeight: FontWeight.bold),
      ),
      radius: 120,
      linearGradient: LinearGradient(
        colors: [
          const Color.fromRGBO(158, 112, 255, 0.5),
          const Color.fromRGBO(49, 79, 251, 0.5),
          const Color.fromRGBO(41, 205, 235, 0.5),
          const Color.fromRGBO(142, 255, 112, 0.5),
        ],
        begin: Alignment.topRight,
        end: Alignment.topLeft,
      ),
      percent: double.parse(snapshot.data.capacidadUsada) / 100,
      animation: true,
      backgroundColor: Color.fromRGBO(241, 236, 251, 0.6),
      lineWidth: 13,
      // progressColor: Color.fromRGBO(36, 102, 13, 1)
    );
  }
}
