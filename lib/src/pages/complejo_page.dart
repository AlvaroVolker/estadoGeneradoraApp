import 'package:estadogeneradoraapp/src/models/generacion.dart';
import 'package:estadogeneradoraapp/src/widgets/circle_progress_bar.dart';
import 'package:estadogeneradoraapp/src/widgets/common/column_gen.dart';
import 'package:estadogeneradoraapp/src/widgets/common/detalle_divider.dart';
import 'package:estadogeneradoraapp/src/widgets/plantas_list.dart';
import 'package:flutter/material.dart';

class ComplejoPage extends StatelessWidget {
  ComplejoPage({Key key, @required this.detalleGeneracion}) : super(key: key);

  final DetalleGeneracion detalleGeneracion;

  Widget _body(DetalleGeneracion detalleGeneracion, BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            _pagesNavigation(),
            _containerGeneration(detalleGeneracion, context),
          ],
        ),
      ),
    );
  }

  Widget _crearAppBar(String nombre, BuildContext context) {
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
                nombre,
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
                    Text('Complejos',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 29)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Text('plantas',
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

  Widget _containerGeneration(
      DetalleGeneracion detalleGeneracion, BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: CircleBar(
                          capacidadUsada: detalleGeneracion.capacidadUsada),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: DataGenerationColumn(
                        capacidadInstalada:
                            detalleGeneracion.capacidadInstalada.toString(),
                        generacionActual:
                            detalleGeneracion.generacionActual.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            DetalleDivider(
                fechaActualizacion: detalleGeneracion.fechaActualizacion),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            PlantasList(snapshot: detalleGeneracion)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: _crearAppBar(detalleGeneracion.nombre, context),
        body: _body(detalleGeneracion, context),
      ),
    );
  }
}
