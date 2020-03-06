import 'package:flutter/material.dart';

class DetalleDivider extends StatelessWidget {
  const DetalleDivider({Key key, @required this.fechaActualizacion})
      : super(key: key);
  final String fechaActualizacion;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Detalle',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 22)),
              ],
            ),
          ),
          SizedBox(width: 7),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              children: <Widget>[
                Text(fechaActualizacion,
                    style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
