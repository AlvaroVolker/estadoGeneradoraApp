import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color.fromRGBO(158, 112, 255, 0.5000),
    const Color.fromRGBO(49, 79, 251, 0.5000),
  ];

  bool showAvg = false;

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white,
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white,
            strokeWidth: 0.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 8,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '1';
              case 1:
                return '2';
              case 2:
                return '3';
              case 3:
                return '4';
              case 4:
                return '5';
              case 5:
                return '6';
              case 6:
                return '7';
              case 7:
                return '8';
              case 8:
                return '9';
              case 9:
                return '10';
              case 10:
                return '11';
              case 11:
                return '12';
              case 12:
                return '13';
              case 13:
                return '14';
              case 14:
                return '15';
              case 15:
                return '16';
              case 16:
                return '17';
              case 17:
                return '18';
              case 18:
                return '19';
              case 19:
                return '20';
              case 20:
                return '21';
              case 21:
                return '22';
              case 22:
                return '23';
              case 23:
                return '24';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 6000:
                return 'NMC';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true, border: Border.all(color: Colors.white, width: 0.5)),
      minX: 0,
      maxX: 23,
      minY: 0,
      maxY: 6000,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3000),
            FlSpot(1, 5200),
            FlSpot(2, 6000),
            FlSpot(3, 3000),
            FlSpot(4, 3000),
            FlSpot(5, 3000),
            FlSpot(6, 4000),
            FlSpot(7, 5000),
            FlSpot(8, 5000),
            FlSpot(9, 3000),
            FlSpot(10, 4000),
            FlSpot(11, 3000),
            FlSpot(12, 2000),
            FlSpot(13, 5000),
            FlSpot(14, 4000),
            FlSpot(15, 6000),
            FlSpot(16, 1000),
            FlSpot(17, 2000),
            FlSpot(18, 3000),
            FlSpot(19, 4000),
            FlSpot(20, 4000),
            FlSpot(21, 5000),
            FlSpot(22, 5000),
            FlSpot(23, 5000),
            
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2.2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 10.0, left: 10.0, top: 23, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
