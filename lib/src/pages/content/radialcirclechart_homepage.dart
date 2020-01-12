import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialCircleChart extends StatelessWidget {
  const RadialCircleChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Colombia', 48, Color.fromRGBO(222, 219, 23, 0)),
      ChartData('Brasil', 51, Color.fromRGBO(109, 176, 97, 0)),
      ChartData('Argentina', 41, Color.fromRGBO(51, 170, 205, 0)),
      ChartData('Chile', 20, Color.fromRGBO(252, 111, 95, 0)),
    ];

    return SfCircularChart(
        legend: Legend(
            isResponsive: true,
            textStyle:
                ChartTextStyle(fontWeight: FontWeight.w300, fontSize: 10),
            isVisible: true,
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap,
            iconWidth: 15),
        series: <CircularSeries>[
          RadialBarSeries<ChartData, String>(
              enableSmartLabels: true,
              maximumValue: 70,
              pointColorMapper: (ChartData data, _) => data.color,
              cornerStyle: CornerStyle.endCurve,
              dataSource: chartData,
              radius: '100%',
              innerRadius: '30%',
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelMapper: (ChartData data, _) => data.x,
              dataLabelSettings: DataLabelSettings(
                  isVisible: false,
                  labelPosition: ChartDataLabelPosition.inside,
                  textStyle:
                      ChartTextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  connectorLineSettings:
                      ConnectorLineSettings(type: ConnectorType.curve)))
        ]);
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}