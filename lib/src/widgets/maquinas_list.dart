import 'package:estadogeneradoraapp/src/models/generacion.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MaquinasList extends StatelessWidget {
  const MaquinasList({
    Key key,
    @required this.snapshot,
  }) : super(key: key);

  final DetalleGeneracion snapshot;

  Color setProgressColor(double capacidadUsada) {
    if (capacidadUsada < 50) {
      if (capacidadUsada < 10) return Color.fromRGBO(235, 112, 112, 1);
      return Color.fromRGBO(255, 217, 142, 1);
    } else {
      return Color.fromRGBO(88, 145, 103, 1);
    }
  }

  Color setBarColor(double capacidadUsada) {
    if (capacidadUsada < 50) {
      if (capacidadUsada < 10) return Color.fromRGBO(235, 112, 112, 0.16);
      return Color.fromRGBO(255, 217, 142, 0.2);
    } else {
      return Color.fromRGBO(88, 145, 103, 0.1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: double.infinity,
          child: ListView.separated(
              itemCount: snapshot.listaDetalleGeneracion.length,
              itemBuilder: (BuildContext context, int index) {
                var snapshotData = snapshot.listaDetalleGeneracion[index];
                var capacUsada = double.parse(snapshotData.capacidadUsada);
                return FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/maquinaPage', arguments: snapshotData);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      snapshotData.nombre,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontSize:
                                              snapshotData.nombre.length > 10
                                                  ? 11
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .fontSize,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "NMC: " +
                                            snapshotData.capacidadInstalada
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: Colors.black38)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    snapshotData.generacionActual.toString(),
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .fontSize,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black38),
                                  ),
                                  Text(
                                    'MW',
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black38),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: LinearPercentIndicator(
                                    addAutomaticKeepAlive: true,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    percent: capacUsada < 0
                                        ? 0.0
                                        : capacUsada / 100 > 1.0
                                            ? 1.0
                                            : capacUsada / 100,
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    linearStrokeCap: LinearStrokeCap.butt,
                                    lineHeight: 10,
                                    progressColor: setProgressColor(capacUsada),
                                    backgroundColor: setBarColor(capacUsada),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                  color: setProgressColor(double.parse(
                                          snapshotData.capacidadUsada))
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                      double.parse(
                                                  snapshotData.capacidadUsada) <
                                              50
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_drop_up,
                                      color: Colors.black54,
                                      size: 15),
                                  Text(
                                    snapshotData.capacidadUsada.toString() +
                                        "%",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                  height: snapshot.listaDetalleGeneracion.length <= 3
                      ? MediaQuery.of(context).size.height * 0.065
                      : MediaQuery.of(context).size.height * 0.03))),
    );
  }
}
