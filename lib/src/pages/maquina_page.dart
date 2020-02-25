import 'package:estadogeneradoraapp/src/core/routes.dart';
import 'package:estadogeneradoraapp/src/widgets/index_circle_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaquinaPage extends StatefulWidget {
  final dynamic snapshot;

  MaquinaPage({Key key, @required this.snapshot}) : super(key: key);

  @override
  _MaquinaPageState createState() => _MaquinaPageState();
}

class _MaquinaPageState extends State<MaquinaPage> {
  @override
  Widget build(BuildContext context) {
     return Container(
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'OpenSans'),
        home: Scaffold(
          appBar: _crearAppBar(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _pagesNavigation(),
            _containerGeneration(widget.snapshot),
          ],
        ),
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

  Widget _crearAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Row(
        children: <Widget>[
          BackButton(
            color: Colors.black,
               onPressed: () {Navigator.pop(context);},)
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
              child: Text(
                widget.snapshot.nombre,
                style: TextStyle(color: Color.fromRGBO(41, 128, 185, 1), fontWeight: FontWeight.w600),
              ),
              elevation: 0,
              onPressed: () {},
            ),
          ),
        )
      ],
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
                    Text('Unidad',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 29)),
                            Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Text(widget.snapshot.nombre,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400)),
                    ),
                  ]

                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _containerGeneration(dynamic snapshot) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: IndexCircleBar(snapshot: snapshot),
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
          ],
        ),
      ),
    );
  }

  Widget _dataGeneration(dynamic snapshot) {
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
                      Text(snapshot.generacionActual.toString(),
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
                    Text(snapshot.capacidadInstalada.toString(),
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
}