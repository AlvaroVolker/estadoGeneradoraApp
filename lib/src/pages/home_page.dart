import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return MyAppState();  
  }
}

class MyAppState extends State<HomePage>{

  int _selectedPage = 0;
  final _pageOptions = [
  Text('Item 1'),
  Text('Item 2'),
  Text('Item 3')
];

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPage,
            onTap: (int index){
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: (Colors.black)),
                title: Text('Home', style: (
                  TextStyle(color: Colors.black)
                ),)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: (Colors.black)),
                title: Text('Favorites', style: (
                  TextStyle(color: Colors.black)
                ),textAlign: TextAlign.end)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.show_chart, color: (Colors.black)),
                title: Text('Graphic', style: (
                  TextStyle(color: Colors.black)
                ),)
              ),
            ],
          ),
          ),
    );
     
  }
}