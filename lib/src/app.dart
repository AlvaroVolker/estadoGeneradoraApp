import 'package:estadogeneradoraapp/src/pages/home_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      //  routes: {
      //    "/home_page": (_) => new WebviewScaffold(
      //      url: 'https://login.live.com/oauth20_desktop.srf',
      //    )
      //  },
      debugShowCheckedModeBanner: false,
      home: Center(
        child: HomePage(),
      ),
    );
  }
}
