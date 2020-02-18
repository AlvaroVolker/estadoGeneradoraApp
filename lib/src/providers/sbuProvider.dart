import 'dart:convert';
import 'package:estadogeneradoraapp/src/models/SBUGen.dart';
import 'package:http/http.dart' as http;

class _DetalleGeneracionProvider {
  DetalleGeneracionSBU detailGeneracion;

  var detalleGen;

  _DetalleGeneracionProvider() {
    getData();
  }

  Future<DetalleGeneracionSBU> getData() async {
    String url = 'https://test-consolaoperaciones.azurewebsites.net';

    var response = await http
        .get(
            '$url/api/MasterDetailEstadoGen/ObtenerDetalleGeneracionSBU?sbuId=1')
        .catchError((error) => throw (error));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      detailGeneracion = crearCabeceraVM(jsonData);

      if (detalleGen != null) {
        for (var u in detalleGen) {
          var detail = crearCabeceraVM(u);
          detailGeneracion.listaDetalleGeneracion.add(detail);
        }
      }
    }
    return detailGeneracion;
  }

  DetalleGeneracionSBU crearCabeceraVM(jsonData) {
    var detailGeneracion = createNewModel(jsonData);
    return detailGeneracion;
  }

  DetalleGeneracionSBU createNewModel(jsonData) {
    DetalleGeneracionSBU detail = new DetalleGeneracionSBU(
        id: jsonData['Id'],
        nombre: jsonData['Nombre'].toString(),
        capacidadInstalada:
            double.parse(jsonData['CapacidadInstalada'].toString()).isNaN
                ? 0
                : double.parse(
                    jsonData['CapacidadInstalada'].toStringAsFixed(1)),
        capacidadUsada:
            !double.parse(jsonData['CapacidadUsada'].toString()).isNaN
                ? jsonData['CapacidadUsada'].toStringAsFixed(0)
                : "0",
        generacionActual:
            double.parse(jsonData['GeneracionActual'].toString()).isNaN
                ? 0
                : double.parse(jsonData['GeneracionActual'].toStringAsFixed(1)),
        fechaActualizacion: jsonData['FechaActualizacion'].toString());

    detalleGen = jsonData['ListaDetalleComposite'];

    if (detalleGen != null) {
      for (var item in detalleGen) {
        detail.listaDetalleGeneracion.add(createNewModel(item));
      }
    }
    return detail;
  }
}

final detalleGeneracion = new _DetalleGeneracionProvider();
