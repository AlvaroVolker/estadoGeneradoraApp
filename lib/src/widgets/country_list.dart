import 'package:estadogeneradoraapp/src/blocs/detalle_generacion_bloc.dart';
import 'package:estadogeneradoraapp/src/models/generacion.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CountryList extends StatelessWidget {
  const CountryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: StreamBuilder(
                stream: blocDetalleGeneracion.getDetalleGen,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        itemCount: snapshot.data.listaDetalleGeneracion.length,
                        itemBuilder: (BuildContext context, int index) {
                          DetalleGeneracion snapshotData =
                              snapshot.data.listaDetalleGeneracion[index];
                          var capacUsada =
                              double.parse(snapshotData.capacidadUsada);
                          return FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/countryPage',
                                  arguments: snapshotData);
                            },
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
                                        child: Hero(
                                          tag: snapshotData.id,
                                          child: Text(
                                            snapshotData.nombre,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        .fontSize +
                                                    0.8,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black54),
                                          ),
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
                                      SizedBox(height: 2),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            "GEN: " +
                                                snapshotData.generacionActual
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.black38)),
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Hero(
                                    tag: snapshotData.capacidadUsada,
                                    child: LinearPercentIndicator(
                                      addAutomaticKeepAlive: true,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      percent: capacUsada < 0
                                          ? 0.0
                                          : capacUsada / 100 > 1.0
                                              ? 1.0
                                              : capacUsada / 100,
                                      width: MediaQuery.of(context).size.width -
                                          250,
                                      linearStrokeCap: LinearStrokeCap.butt,
                                      lineHeight: 20,
                                      progressColor:
                                          setProgressColor(capacUsada),
                                      backgroundColor: setBarColor(capacUsada),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: setProgressColor(double.parse(
                                              snapshotData.capacidadUsada))
                                          .withOpacity(0.09),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                          double.parse(snapshotData
                                                      .capacidadUsada) <
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
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                                height: screenHeight > 700
                                    ? MediaQuery.of(context).size.height * 0.05
                                    : MediaQuery.of(context).size.height *
                                        0.03));
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ],
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
