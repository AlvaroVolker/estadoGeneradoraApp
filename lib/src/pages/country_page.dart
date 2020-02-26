import 'package:estadogeneradoraapp/src/widgets/complejos_list.dart';
import 'package:estadogeneradoraapp/src/widgets/index_circle_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountryPage extends StatefulWidget {
  final dynamic snapshot;

  const CountryPage({Key key, @required this.snapshot}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _crearAppBar(),
    body: _body(),
    bottomNavigationBar: _crearBottomBar(),
        );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
          child: Column(
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BackButton(
            color: Colors.black,
               onPressed: () {Navigator.of(context).pop();},)
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
                    Text('País',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 29)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Text('complejos',
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

  Widget _containerGeneration(dynamic snapshot) {
    return Expanded(
      child: Container(
          child: Column(
            children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: IndexCircleBar(snapshot: snapshot),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: _dataGeneration(snapshot),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
                        color: Colors.black87,
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
                Text(snapshot.fechaActualizacion.toString(),
                    style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w300,
                        fontSize: 10)),
              ],
            ),
          )
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      ComplejosList(snapshot: snapshot)
            ],
          ),
        ),
    );
  }

  Widget _dataGeneration(dynamic snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
