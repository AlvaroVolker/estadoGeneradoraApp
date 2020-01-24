import 'package:estadogeneradoraapp/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      //  routes: {
      //    "/": (_) => new WebviewScaffold(
      //      url: 'https://login.microsoftonline.com/common/',
      //    )
      //  },
      debugShowCheckedModeBanner: false,
      home: Center(
        child: HomePage(),
      ),
    );
  }
}
