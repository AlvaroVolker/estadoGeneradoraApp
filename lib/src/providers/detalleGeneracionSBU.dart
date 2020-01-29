import 'dart:convert';
import 'package:estadogeneradoraapp/src/models/SBUGen.dart';
import 'package:http/http.dart' as http;

class _DetalleGeneracionProvider {
  String nombre;
  String fechaActualizacion;
  double generacionActual;
  double capacidadInstalada;
  double capacidadUsada;
  DetalleGeneracion detailGeneracion;

  _DetalleGeneracionProvider() {
    getData();
  }

  Future<DetalleGeneracion> getData() async {
    var response = await http.get(
        'https://test-consolaoperaciones.azurewebsites.net/api/MasterDetailEstadoGen/ObtenerDetalleGeneracionSBU?sbuId=1');

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      jsonDataAsign(jsonData);
      detailGeneracion = createNewModel();
      var detalleGen = jsonData['ListaDetalleComposite'];

      for (var u in detalleGen) {
        jsonDataAsign(u);
        DetalleGeneracion detail = createNewModel();
        detailGeneracion.listaDetalleGeneracion.add(detail);
      }
    }
    print(detailGeneracion);
    return detailGeneracion;
  }

  DetalleGeneracion createNewModel() {
    DetalleGeneracion detail = new DetalleGeneracion(
      nombre: nombre,
      capacidadInstalada: capacidadInstalada,
      capacidadUsada: capacidadUsada,
      fechaActualizacion: fechaActualizacion,
      generacionActual: generacionActual,
    );
    return detail;
  }

  void jsonDataAsign(jsonData) {
    nombre = jsonData['Nombre'].toString();
    fechaActualizacion = (jsonData['FechaActualizacion'].toString());
    generacionActual = double.parse(jsonData['GeneracionActual'].toString());
    capacidadInstalada =
        double.parse(jsonData['CapacidadInstalada'].toString());
    capacidadUsada = double.parse(jsonData['CapacidadUsada'].toString());
  }
}

final detalleGeneracion = new _DetalleGeneracionProvider();
