import 'package:estadogeneradoraapp/src/pages/country_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CountryList extends StatelessWidget {
  const CountryList({
    Key key,
    @required this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Container(
          child: ListView.separated(
            itemCount: snapshot.data.listaDetalleGeneracion.length,
            itemBuilder: (BuildContext context, int index) {
              var snapshotData = snapshot.data.listaDetalleGeneracion[index];
              var capacUsada = double.parse(snapshotData.capacidadUsada);
              return FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CountryPage(id: snapshotData.id),
                  ));
                },
                child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        snapshotData.nombre,
                        style: TextStyle(color: Colors.black54),
                      ),
                      LinearPercentIndicator(
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
                const Divider(height: 25),
          ),
        ),
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
