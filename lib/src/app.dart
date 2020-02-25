import 'package:estadogeneradoraapp/src/core/routes.dart';
import 'package:estadogeneradoraapp/src/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'pages/country_page.dart';
import 'pages/plantas_page.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

///TODO: con este manejo de rutas no hace falta la otra clase es mucho mas simple
class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/countryPage': (context) => CountryPage(),
        '/plantaPage': (context) => PlantaPage(),
      },
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      home: Center(
        child: HomePage(),
      ),
    );
  }
}
