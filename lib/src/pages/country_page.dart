import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  final int id;

  CountryPage({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}


class _CountryPageState extends State<CountryPage> {
  dynamic datos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: datos,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Container(
              child: Text(widget.id.toString()),
            ),
          ),
        ),
      );
      }
    );
  }

  Widget circleProgressBar(){

    

  }
}
