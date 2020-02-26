import 'dart:async';
import 'dart:ui';
import 'package:estadogeneradoraapp/src/blocs/detalle_generacion_bloc.dart';
import 'package:estadogeneradoraapp/src/core/routes.dart';
import 'package:estadogeneradoraapp/src/widgets/circle_progress_bar.dart';
import 'package:estadogeneradoraapp/src/widgets/common/bottom_bar.dart';
import 'package:estadogeneradoraapp/src/widgets/common/column_gen.dart';
import 'package:estadogeneradoraapp/src/widgets/common/detalle_divider.dart';
import 'package:estadogeneradoraapp/src/widgets/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<HomePage> {
  Timer timer;

  var data;

  @override
  void initState() {
    super.initState();
    _getData();
    timer = Timer.periodic(Duration(minutes: 2), (Timer t) {
      setState(() {
        _getData();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans'),
      themeMode: ThemeMode.light,
      home: Container(
        child: FutureBuilder(
            future: _getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.mood_bad,
                              size: 40, color: Colors.lightBlue),
                          SizedBox(height: 10),
                          Text('No pudimos recuperar algunos datos...',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 14,
                                  decoration: TextDecoration.none)),
                          SizedBox(height: 40),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color.fromRGBO(234, 242, 248, 1),
                            ),
                            child: MaterialButton(
                              child: Text(
                                'Reintentar',
                                style: TextStyle(
                                    color: Color.fromRGBO(41, 128, 185, 1)),
                              ),
                              elevation: 0,
                              onPressed: () {
                                setState(() {
                                  _getData();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    gradient: Gradients.aliHussien,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: SpinKitChasingDots(
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'AES',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    ),
                                    Container(
                                        width: 100,
                                        child: Text(
                                          'SmartGen',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Colors.black54,
                                              fontSize: 19,
                                              fontFamily: 'OpenSans'),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                case ConnectionState.done:
                  return Scaffold(
                      appBar: _crearAppBar(),
                      body: _body(snapshot),
                      bottomNavigationBar: BottomBar());
                default:
                  return Text('default');
              }
            }),
      ),
    );
  }

  _getData() async {
    return await blocDetalleGeneracion.getData();
  }

  Widget _body(dynamic snapshot) {
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

  Widget _crearAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: FlatButton(
          onPressed: () {},
          child: Icon(FontAwesomeIcons.gripLines, color: Colors.black)),
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
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: CircleBar(
                          capacidadUsada: snapshot.data.capacidadUsada),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: DataGenerationColumn(
                        capacidadInstalada:
                            snapshot.data.capacidadInstalada.toString(),
                        generacionActual:
                            snapshot.data.generacionActual.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.0),
            DetalleDivider(
                fechaActualizacion:
                    snapshot.data.fechaActualizacion.toString()),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CountryList()
          ],
        ),
      ),
    );
  }
}
