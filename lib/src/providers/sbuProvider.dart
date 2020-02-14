import 'dart:convert';
import 'package:estadogeneradoraapp/src/models/SBUGen.dart';
import 'package:http/http.dart' as http;
class _DetalleGeneracionProvider {
  int id;
  String nombre;
  String fechaActualizacion;
  double generacionActual;
  double capacidadInstalada;
  String capacidadUsada;
  DetalleGeneracion detailGeneracion;

  _DetalleGeneracionProvider() {
    getData();
  }

  Future<DetalleGeneracion> getData() async {
    String url = 'https://test-consolaoperaciones.azurewebsites.net';

    var response = await http
        .get(
            '$url/api/MasterDetailEstadoGen/ObtenerDetalleGeneracionSBU?sbuId=1')
        .catchError((error) => throw (error));

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
    return detailGeneracion;
  }

  DetalleGeneracion createNewModel() {
    DetalleGeneracion detail = new DetalleGeneracion(
      id: id,
      nombre: nombre,
      capacidadInstalada: capacidadInstalada,
      capacidadUsada: capacidadUsada,
      fechaActualizacion: fechaActualizacion,
      generacionActual: generacionActual,
    );
    return detail;
  }

  void jsonDataAsign(jsonData) {
    id = jsonData['Id'];
    nombre = jsonData['Nombre'].toString();
    fechaActualizacion = jsonData['FechaActualizacion'].toString();
    generacionActual =
        double.parse(jsonData['GeneracionActual'].toStringAsFixed(1));
    capacidadInstalada =
        double.parse(jsonData['CapacidadInstalada'].toStringAsFixed(1));
    capacidadUsada = jsonData['CapacidadUsada'].toStringAsFixed(0);
  }
}

final detalleGeneracion = new _DetalleGeneracionProvider();
