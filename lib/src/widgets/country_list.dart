import 'package:estadogeneradoraapp/src/blocs/detalle_generacion_bloc.dart';
import 'package:estadogeneradoraapp/src/models/generacion.dart';
import 'package:estadogeneradoraapp/src/widgets/error_widget.dart';
import 'package:estadogeneradoraapp/util/loader.dart';
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
                  if (!snapshot.hasData) return Loader();
                  if (snapshot.hasError) return BadRequestWidget();

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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              snapshotData.nombre,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                  fontSize: snapshotData
                                                              .nombre.length >
                                                          10
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
                                                    snapshotData
                                                        .capacidadInstalada
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
                                            snapshotData.generacionActual
                                                .toString(),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            linearStrokeCap:
                                                LinearStrokeCap.butt,
                                            lineHeight: 13,
                                            progressColor:
                                                setProgressColor(capacUsada),
                                            backgroundColor:
                                                setBarColor(capacUsada),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.13,
                                      decoration: BoxDecoration(
                                          color: setProgressColor(double.parse(
                                                  snapshotData.capacidadUsada))
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            snapshotData.capacidadUsada
                                                    .toString() +
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
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                              height: screenHeight > 700
                                  ? MediaQuery.of(context).size.height * 0.06
                                  : MediaQuery.of(context).size.height * 0.04));
                }),
          ),
        ],
      ),
    );
  }

  Color setProgressColor(double capacidadUsada) {
    if (capacidadUsada < 50) {
      if (capacidadUsada < 10) return Color.fromRGBO(252, 121, 120, 1);
      return Color.fromRGBO(255, 217, 142, 1);
    } else {
      return Color.fromRGBO(88, 145, 103, 1);
    }
  }

  Color setBarColor(double capacidadUsada) {
    if (capacidadUsada < 50) {
      if (capacidadUsada < 10) return Color.fromRGBO(252, 121, 120, 0.16);
      return Color.fromRGBO(255, 217, 142, 0.2);
    } else {
      return Color.fromRGBO(88, 145, 103, 0.1);
    }
  }
}
