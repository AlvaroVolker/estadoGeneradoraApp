import 'package:estadogeneradoraapp/src/pages/complejo_page.dart';
import 'package:estadogeneradoraapp/src/pages/country_page.dart';
import 'package:estadogeneradoraapp/src/pages/home_page.dart';
import 'package:estadogeneradoraapp/src/pages/maquina_page.dart';
import 'package:estadogeneradoraapp/src/pages/plantas_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/countryPage':
        return MaterialPageRoute(builder: (_) => CountryPage(detalleGeneracion: args));
      case '/complejoPage':
        return MaterialPageRoute(builder: (_) => ComplejoPage(detalleGeneracion:args));
      case '/plantaPage':
        return MaterialPageRoute(builder: (_) => PlantaPage(snapshot: args));
      case '/maquinaPage':
        return MaterialPageRoute(builder: (_) => MaquinaPage(snapshot: args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
