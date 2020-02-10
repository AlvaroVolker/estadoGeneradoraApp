import 'package:flutter/material.dart';

void main() => runApp(CountryPage());

class CountryPage extends StatelessWidget {
  final int id;

  CountryPage({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            child: Text(id.toString()),
          ),
        ),
      ),
    );
  }
}
