import 'package:estadogeneradoraapp/src/models/generacion.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleBar extends StatelessWidget {
  const CircleBar({
    Key key,
    @required this.generacion,
  }) : super(key: key);

  final DetalleGeneracion generacion;

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(colors: [
      const Color.fromRGBO(41, 205, 235, 0.5),
      const Color.fromRGBO(49, 79, 251, 0.5),
      const Color.fromRGBO(158, 112, 255, 0.5),
      const Color.fromRGBO(142, 255, 112, 0.5)
    ]).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    var capacUsada = double.parse(generacion.capacidadUsada);
    return new CircularPercentIndicator(
      animationDuration: 2,
      addAutomaticKeepAlive: true,
      animateFromLastPercent: true,
      startAngle: 0,
      center: Text(
        " " + generacion.capacidadUsada + "%",
        style: TextStyle(
            foreground: Paint()..shader = linearGradient,
            fontSize: 27,
            fontWeight: FontWeight.bold),
      ),
      radius: 120,
      linearGradient: LinearGradient(
        colors: [
          const Color.fromRGBO(158, 112, 255, 0.5),
          const Color.fromRGBO(49, 79, 251, 0.5),
          const Color.fromRGBO(41, 205, 235, 0.5),
          const Color.fromRGBO(142, 255, 112, 0.5),
        ],
        begin: Alignment.topRight,
        end: Alignment.topLeft,
      ),
      percent: capacUsada / 100 < 0
          ? 0
          : capacUsada / 100 > 1 ? 1.0 : capacUsada / 100,
      animation: true,
      backgroundColor: Color.fromRGBO(241, 236, 251, 0.6),
      lineWidth: 13,
      // progressColor: Color.fromRGBO(36, 102, 13, 1)
    );
  }
}
