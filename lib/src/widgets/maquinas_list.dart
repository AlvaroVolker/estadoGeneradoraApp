import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MaquinasList extends StatelessWidget {
  const MaquinasList({
    Key key,
    @required this.snapshot,
  }) : super(key: key);

  final dynamic snapshot;

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
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshotData.nombre,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "NMC: " +
                                      snapshotData.capacidadInstalada
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.black38)),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: LinearPercentIndicator(
                          addAutomaticKeepAlive: true,
                          animation: true,
                          animateFromLastPercent: true,
                          percent: capacUsada / 100,
                          width: MediaQuery.of(context).size.width - 250,
                          linearStrokeCap: LinearStrokeCap.butt,
                          lineHeight: 20,
                          progressColor: setProgressColor(capacUsada),
                          backgroundColor: setBarColor(capacUsada),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                              double.parse(snapshotData.capacidadUsada) < 50
                                  ? Icons.arrow_drop_down
                                  : Icons.arrow_drop_up,
                              color: Colors.black54,
                              size: 25),
                          Text(
                            snapshotData.capacidadUsada.toString() + " %",
                            style: TextStyle(
                                color: Colors.black54,
                                backgroundColor: setBarColor(
                                    double.parse(snapshotData.capacidadUsada)),
                                fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                 Divider(height: MediaQuery.of(context).size.height * 0.05)),
      ),
    );
  }

  Color setProgressColor(double capacidadUsada) {
    if (capacidadUsada < 50) {
      if (capacidadUsada < 10) return Color.fromRGBO(253, 105, 105, 1);
      return Color.fromRGBO(249, 231, 159, 1);
    } else {
      return Color.fromRGBO(36, 102, 13, 1);
    }
  }

  Color setBarColor(double capacidadUsada) {
    if (capacidadUsada < 50) {
      if (capacidadUsada < 10) return Color.fromRGBO(253, 105, 105, 0.1);
      return Color.fromRGBO(249, 231, 159, 0.2);
    } else {
      return Color.fromRGBO(36, 102, 13, 0.1);
    }
  }
}
