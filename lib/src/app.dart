import 'package:estadogeneradoraapp/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      // routes: {
      //   "/": (_) => new WebviewScaffold(
      //     url: 'https://login.microsoftonline.com/common/oauth2/v2.0/authorize',
      //   )
      // },
      debugShowCheckedModeBanner: false,
      home: Center(
        child: HomePage(),
      ),
    );
  }
}
