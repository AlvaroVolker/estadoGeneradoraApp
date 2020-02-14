import 'package:estadogeneradoraapp/src/pages/country_page.dart';
import 'package:estadogeneradoraapp/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/countryPage':
          return MaterialPageRoute(builder: (_) => CountryPage(snapshot: args));
        // return _errorRoute();
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
