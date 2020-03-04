import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      gradient: Gradients.aliHussien,
                      borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: SpinKitChasingDots(
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: Text(
                          'AES',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black45,
                              fontSize: 16,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      Container(
                          width: 100,
                          child: Text(
                            'SmartGen',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black54,
                                fontSize: 19,
                                fontFamily: 'OpenSans'),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
