import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<HomePage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Generacion',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          bottomNavigationBar: _crearBottomBar(),
        ),
      ),
    );
  }

  Widget _crearBottomBar() {
    return Container(
      child: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: (Colors.black87)),
              title: Text(
                'Home',
                style: (TextStyle(color: Colors.black87)),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: (Colors.black87)),
              title: Text('Favorites',
                  style: (TextStyle(color: Colors.black87)),
                  textAlign: TextAlign.end)),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart, color: (Colors.black87)),
              title: Text(
                'Graphic',
                style: (TextStyle(color: Colors.black87)),
              )),
        ],
      ),
    );
  }
}
