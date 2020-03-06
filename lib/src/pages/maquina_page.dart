import 'package:estadogeneradoraapp/src/widgets/circle_progress_bar.dart';
import 'package:estadogeneradoraapp/src/widgets/common/column_gen.dart';
import 'package:flutter/material.dart';

class MaquinaPage extends StatefulWidget {
  final dynamic snapshot;

  MaquinaPage({Key key, @required this.snapshot}) : super(key: key);

  @override
  _MaquinaPageState createState() => _MaquinaPageState();
}

class _MaquinaPageState extends State<MaquinaPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Scaffold(
          appBar: _crearAppBar(),
          body: _body(),
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

  Widget _crearAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Row(
        children: <Widget>[
          BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          )
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
                style: TextStyle(
                    color: Color.fromRGBO(41, 128, 185, 1),
                    fontWeight: FontWeight.w600),
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
                      child: CircleBar(capacidadUsada: snapshot.capacidadUsada),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: DataGenerationColumn(
                        capacidadInstalada:
                            snapshot.capacidadInstalada.toString(),
                        generacionActual: snapshot.generacionActual.toString(),
                      ),
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
}
