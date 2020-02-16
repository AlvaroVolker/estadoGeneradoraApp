import 'package:estadogeneradoraapp/src/widgets/index_circle_bar.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  final dynamic snapshot;

  const CountryPage({Key key, @required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
          body: Center(child: IndexCircleBar(snapshot: snapshot)),
        ),
      ),
    );
  }
}
