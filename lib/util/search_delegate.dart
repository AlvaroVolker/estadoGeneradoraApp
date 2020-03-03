import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {
    // acciones del appbar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono a la izquierda del appbar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //crear los resultados a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // sugerencias al escribir
      return Container();
  }
}
