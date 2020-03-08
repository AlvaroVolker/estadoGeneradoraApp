import 'package:estadogeneradoraapp/src/blocs/detalle_generacion_bloc.dart';
import 'package:estadogeneradoraapp/src/widgets/circle_progress_bar.dart';
import 'package:estadogeneradoraapp/src/widgets/common/column_gen.dart';
import 'package:estadogeneradoraapp/src/widgets/common/detalle_divider.dart';
import 'package:estadogeneradoraapp/src/widgets/country_list.dart';
import 'package:estadogeneradoraapp/src/widgets/error_widget.dart';
import 'package:estadogeneradoraapp/util/loader.dart';
import 'package:flutter/material.dart';

class SBUPage extends StatefulWidget {
  SBUPage({Key key}) : super(key: key);

  @override
  _SBUPageState createState() => _SBUPageState();
}

class _SBUPageState extends State<SBUPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Loader();
          if (snapshot.hasError) return BadRequestWidget();

          return Material(
            child: Scaffold(
              body: Container(
                color: Theme.of(context).accentIconTheme.color,
                  child: Column(
                children: <Widget>[
                  _pagesNavigation(),
                  _containerGeneration(snapshot)
                ],
              )),
            ),
          );
        });
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
                            color: Theme.of(context).textTheme.bodyText2.color,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            CountryList()
          ],
        ),
      ),
    );
  }

  _getData() async {
    return await blocDetalleGeneracion.getData();
  }
}
