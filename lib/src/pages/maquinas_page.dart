import 'package:flutter/material.dart';

class MaquinaPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
          body: Center(child: Text('hola')),
        ),
      ),
    );
  }
}
