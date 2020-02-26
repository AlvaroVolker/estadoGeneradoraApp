import 'package:flutter/material.dart';

class DataGenerationColumn extends StatelessWidget {

  const DataGenerationColumn({Key key, @required this.capacidadInstalada, @required this.generacionActual}) : super(key: key);

  final String generacionActual;
  final String capacidadInstalada;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Entregando",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: <Widget>[
              Text(generacionActual,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17)),
              Text(
                ' MWh',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 100,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Capacidad',
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Text(capacidadInstalada,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17)),
            Text(
              ' MWh',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ],
    )
    );
  }
}