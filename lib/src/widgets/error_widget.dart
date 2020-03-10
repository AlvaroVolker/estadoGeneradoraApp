import 'package:estadogeneradoraapp/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class BadRequestWidget extends StatefulWidget {
  BadRequestWidget({Key key}) : super(key: key);

  @override
  _BadRequestWidgetState createState() => _BadRequestWidgetState();
}

class _BadRequestWidgetState extends State<BadRequestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.mood_bad, size: 40, color: Colors.lightBlue),
            SizedBox(height: 10),
            Text('No pudimos recuperar algunos datos...',
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 14,
                    decoration: TextDecoration.none)),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromRGBO(234, 242, 248, 1),
              ),
              child: MaterialButton(
                child: Text(
                  'Reintentar',
                  style: TextStyle(color: Color.fromRGBO(41, 128, 185, 1)),
                ),
                elevation: 0,
                onPressed: () {
                  setState(() {
                    HomePage();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
