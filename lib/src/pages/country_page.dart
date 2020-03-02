import 'package:estadogeneradoraapp/src/blocs/detalle_generacion_bloc.dart';
import 'package:estadogeneradoraapp/src/models/generacion.dart';
import 'package:estadogeneradoraapp/src/widgets/circle_progress_bar.dart';
import 'package:estadogeneradoraapp/src/widgets/common/bottom_bar.dart';
import 'package:estadogeneradoraapp/src/widgets/common/column_gen.dart';
import 'package:estadogeneradoraapp/src/widgets/common/detalle_divider.dart';
import 'package:estadogeneradoraapp/src/widgets/complejos_list.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {

  final DetalleGeneracion detalleGeneracion;

  const CountryPage({
    Key key,
    @required this.detalleGeneracion,
  }) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: _crearAppBar(context, widget.detalleGeneracion.nombre),
      body: _body(widget.detalleGeneracion, context),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _body(DetalleGeneracion detalleGeneracion, BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            _pagesNavigation(),
            _countrySelector(),
            _containerGeneration(detalleGeneracion, context),
          ],
        ),
      ),
    );
  }

  Widget _crearAppBar(BuildContext context, String nombre) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: widget.detalleGeneracion.id,
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
          ),
        )
      ],
    );
  }

  Widget _countrySelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 50,
        child: StreamBuilder(
            stream: blocDetalleGeneracion.getDetalleGen,
            builder: (context, snapshot) {
              return ListView.separated(
                itemCount: snapshot.data.listaDetalleGeneracion.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  DetalleGeneracion snapshotData =
                      snapshot.data.listaDetalleGeneracion[index];
                  return Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {

                            
                            
                          });
                        },
                        child: Container(
                          height: 20,
                          width: snapshotData.nombre.length >= 8 ? 70 : 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(91, 178, 197, 1)),
                          child: Text(
                            snapshotData.nombre.toLowerCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 15),
              );
            }),
      ),
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

  Widget _containerGeneration(
      DetalleGeneracion snapshot, BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: CircleBar(capacidadUsada: snapshot.capacidadUsada),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            DetalleDivider(fechaActualizacion: snapshot.fechaActualizacion),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ComplejosList(snapshot: snapshot)
          ],
        ),
      ),
    );
  }
}
