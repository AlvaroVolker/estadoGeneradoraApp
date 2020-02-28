import 'package:estadogeneradoraapp/src/core/routes.dart';
import 'package:estadogeneradoraapp/src/pages/home_page.dart';
import 'package:estadogeneradoraapp/src/widgets/common/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Center(
        child: Scaffold(
            body: _callPage(_currentIndex),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                  primaryColor: Colors.black87,
                  textTheme: Theme.of(context).textTheme.copyWith(
                      caption:
                          TextStyle(color: Colors.black87.withOpacity(0.2)))),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                selectedFontSize: 10,
                unselectedFontSize: 0,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.home),
                    title: Container(),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.heart), title: Container()),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.chartBar),
                      title: Container()),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            )),
      ),
    );
  }

  Widget _callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return Container(child: Center(child: Text('hola')));

      default:
        return Text('hollll');
    }
  }
}
