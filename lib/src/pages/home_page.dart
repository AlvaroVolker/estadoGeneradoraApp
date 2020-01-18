import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

  
}

class MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: _crearBottomBar(),
        ),
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            _crearAppBar(),
            _pagesNavigation(),
            _containerGeneration()
          ],
        ),
      ),
    );
  }

  Widget _crearAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: CircleAvatar(
            child: Text('SL'),
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _crearBottomBar() {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _bottomAction(FontAwesomeIcons.home),
          _bottomAction(FontAwesomeIcons.heart),
          _bottomAction(FontAwesomeIcons.chartBar),
          _bottomAction(FontAwesomeIcons.cog),
        ],
      ),
    );
  }

  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(icon),
      ),
      onTap: () {},
    );
  }

  Widget _pagesNavigation() {
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(children: <Widget>[
                  Text('Generación',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 27)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 8),
                    child: Text('Favoritos',
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                  Expanded(
                    flex: 12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            isExpanded: true,
                            items: <DropdownMenuItem>[
                              new DropdownMenuItem(
                                child: new Text('Hola'),
                              )
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _textGeneration() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Entregando",
                    style: TextStyle(fontWeight: FontWeight.w300),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Text('2270,80',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
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
                  Text(
                    'Capacidad',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Row(
                    children: <Widget>[
                      Text('11233',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Text(
                        ' MWh',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _containerGeneration() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Container(
                width: 250,
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child:
                          Container(height: 500, width: 500, child: _chart()),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, right: 20),
              child: new Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[_textGeneration()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chart() {
    final List<ChartData> chartData = [
      ChartData('Colombia', 48, Color.fromRGBO(222, 219, 23, 0)),
      ChartData('Brasil', 51, Color.fromRGBO(109, 176, 97, 0)),
      ChartData('Argentina', 41, Color.fromRGBO(51, 170, 205, 0)),
      ChartData('Chile', 20, Color.fromRGBO(252, 111, 95, 0)),
    ];

    return SfCircularChart(
        legend: Legend(
            isResponsive: true,
            textStyle: ChartTextStyle(fontWeight: FontWeight.w300),
            isVisible: true,
            position: LegendPosition.left,
            iconWidth: 15),
        series: <CircularSeries>[
          RadialBarSeries<ChartData, String>(
              enableSmartLabels: true,
              maximumValue: 70,
              pointColorMapper: (ChartData data, _) => data.color,
              cornerStyle: CornerStyle.bothFlat,
              dataSource: chartData,
              radius: '90%',
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


// Widget _chartBar(){
//   return new charts.BarChart(
//       seriesList,
//       animate: animate,
//       barGroupingType: charts.BarGroupingType.stacked,
//       vertical: false,
//     );
// }

}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
