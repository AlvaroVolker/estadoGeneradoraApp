import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        backgroundColor: Color.fromRGBO(255,255,255, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () {},
        ),
      ),

      body: Center(
        child: Text(
          'HomePage',
          style: new TextStyle(
            fontSize: 50,
            color: Colors.blueGrey,
            fontFamily: 'RobotoMono'
          ), 
        )
      ),
    );
  }


}