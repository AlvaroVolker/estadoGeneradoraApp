import 'dart:async';
import 'dart:ui';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:estadogeneradoraapp/src/bloc/detalle_generacion_bloc.dart';
import 'package:estadogeneradoraapp/src/core/routes.dart';
import 'package:estadogeneradoraapp/src/widgets/circle_progress_bar.dart';
import 'package:estadogeneradoraapp/src/widgets/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

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

  final AadOAuth oAuth = AadOAuth(config);
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var rectSize =
        Rect.fromLTWH(0.0, 25.0, screenSize.width, screenSize.height - 25);
    oAuth.setWebViewScreenSize(rectSize);

    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Container(
        child: Scaffold(
          appBar: _crearAppBar(),
          body: _body(),
          bottomNavigationBar: _crearBottomBar(),
        ),
      ),
    );
  }

  _getData() async {
    return await blocDetalleGeneracion.getData();
  }

  Widget _body() {
    return FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return SafeArea(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _pagesNavigation(),
                    _containerGeneration(snapshot),
                  ],
                ),
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
          SizedBox(width: 32.0),
          Icon(FontAwesomeIcons.gripLines, color: Colors.black)
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(234, 242, 248, 1),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/plantaPage');
              },
              child: Text(
                'Castilla',
                style: TextStyle(color: Color.fromRGBO(41, 128, 185, 1)),
              ),
              elevation: 0,
            ),
          ),
        )
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
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
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
                            fontSize: 29)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Text('favoritos',
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
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: CircleBar(snapshot: snapshot),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: _dataGeneration(snapshot),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('Detalle',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 22)),
                    ],
                  ),
                ),
                SizedBox(width: 7),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Column(
                      children: <Widget>[
                        Text(snapshot.data.fechaActualizacion,
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w300,
                                fontSize: 10)),
                      ],
                    ),
                )
              ],
            ),
            SizedBox(height: 18),
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
                  child: Row(
                    children: <Widget>[
                      Text(snapshot.data.generacionActual.toString(),
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
                Row(
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
              ],
            ),
          ],
        ),
      ],
    ));
  }


// Widget _chartBar(){
//   return new charts.BarChart(
//       seriesList,
//       animate: animate,
//       barGroupingType: charts.BarGroupingType.stacked,
//       vertical: false,
//     );
// }

}
