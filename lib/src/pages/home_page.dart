import 'dart:ui';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text("Generación",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22)
                        ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("Favoritos",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 16)
                        ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                  child: Row(
                children: <Widget>[
                  Icon(Icons.person),
                  Container(
                    margin: EdgeInsets.only(left: 2),
                  )
                ],
              )),
            ],
          ),
        ));
  }
}