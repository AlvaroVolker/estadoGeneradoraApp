import 'package:flutter/material.dart';


class SideBarWidget extends StatefulWidget {
  SideBarWidget({Key key}) : super(key: key);

  @override
  _SideBarWidgetState createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Align(
         alignment: Alignment.centerLeft,
         child: Column(
           mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text('Home'),
             SizedBox(height: 10),
             Text('Graph')
           ],
         ),
       )
         
       
    );
  }
}