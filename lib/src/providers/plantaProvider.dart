import 'dart:convert';

import 'package:estadogeneradoraapp/src/models/SBUGen.dart';
import 'package:http/http.dart' as http;

class _DetalleGeneracionPlantaProvider {
  int id;
  String nombre;
  String fechaActualizacion;
  double generacionActual;
  double capacidadInstalada;
  String capacidadUsada;
  DetalleGeneracion detailGeneracion;

  _DetalleGeneracionPlantaProvider() {
    getData();
  }

  Future<DetalleGeneracion> getData() async {
    
    var response = await http
        .get(
            'https://test-consolaoperaciones.azurewebsites.net/api/MasterDetailEstadoGen/ObtenerDetalleGeneracionCentral?centralId=2950')
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
    if (!double.parse(jsonData['GeneracionActual'].toString()).isNaN) {
      generacionActual =
          double.parse(jsonData['GeneracionActual'].toStringAsFixed(1));
    } else {
      generacionActual = 0;
    }
    if (!double.parse(jsonData['CapacidadInstalada'].toString()).isNaN) {
      capacidadInstalada =
          double.parse(jsonData['CapacidadInstalada'].toStringAsFixed(1));
    } else {
      capacidadInstalada = 0;
    }
    if (!double.parse(jsonData['CapacidadUsada'].toString()).isNaN) {
      capacidadUsada = jsonData['CapacidadUsada'].toStringAsFixed(0);
    } else {
      capacidadInstalada = 0;
    }
  }
}

final detallePlanta = _DetalleGeneracionPlantaProvider();
