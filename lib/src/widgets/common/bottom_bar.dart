import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.black87,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Colors.black87.withOpacity(0.2)))),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 10,
        unselectedFontSize: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
               title: Text('home'),
               ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart), title: Text('favs')),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartBar), title: Text('chart')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  //   return Container(
  //      child:  BottomAppBar(
  //     color: Colors.white,
  //     child: Row(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: <Widget>[
  //         _bottomAction(FontAwesomeIcons.home),
  //         _bottomAction(FontAwesomeIcons.heart),
  //         _bottomAction(FontAwesomeIcons.chartBar),
  //         _bottomAction(FontAwesomeIcons.cog),
  //       ],
  //     ),
  //   )
  //   );
  // }

  // Widget _bottomAction(IconData icon) {
  //   return InkWell(
  //     focusColor: Colors.transparent,
  //     highlightColor: Colors.transparent,
  //     hoverColor: Colors.transparent,
  //     splashColor: Colors.transparent,
  //     child: Padding(
  //       padding: const EdgeInsets.all(15.0),
  //       child: Icon(icon),
  //     ),
  //     onTap: () {

  //     },
  //   );
  // }

}
