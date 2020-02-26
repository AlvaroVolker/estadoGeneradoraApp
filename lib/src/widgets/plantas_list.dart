import 'package:estadogeneradoraapp/src/models/generacion.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PlantasList extends StatelessWidget {
  const PlantasList({
    Key key,
    @required this.snapshot,
  }) : super(key: key);

  final DetalleGeneracion snapshot;

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
                        .pushNamed('/plantaPage', arguments: snapshotData);
                  },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: snapshotData.nombre.length > 12 ? 110 : 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshotData.nombre,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .fontSize,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black54),
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
                            percent: capacUsada < 0
                                ? 0.0
                                : capacUsada / 100 > 1.0
                                    ? 1.0
                                    : capacUsada / 100,
                            width: MediaQuery.of(context).size.width - 230,
                            linearStrokeCap: LinearStrokeCap.butt,
                            lineHeight: 20,
                            progressColor: setProgressColor(capacUsada),
                            backgroundColor: setBarColor(capacUsada),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: setProgressColor(
                                      double.parse(snapshotData.capacidadUsada))
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                  double.parse(snapshotData.capacidadUsada) < 50
                                      ? Icons.arrow_drop_down
                                      : Icons.arrow_drop_up,
                                  color: Colors.black54,
                                  size: 15),
                              Text(
                                snapshotData.capacidadUsada.toString() + "%",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                  height: snapshot.listaDetalleGeneracion.length <= 3
                      ? MediaQuery.of(context).size.height * 0.063
                      : MediaQuery.of(context).size.height * 0.03))),
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
