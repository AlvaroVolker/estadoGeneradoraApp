import 'dart:convert';
import 'package:estadogeneradoraapp/src/models/SBUGen.dart';
import 'package:rxdart/rxdart.dart';
import '../models/SBUGen.dart';
import 'package:http/http.dart' as http;


class DetalleGeneracionBloc{

  final _detalleGen = BehaviorSubject<DetalleGeneracion>();

  ///DetalleGeneracion BLOC

  //Con este stream obtenes lo que hay en detalle generacion traido del JSON
  Observable<DetalleGeneracion> get getDetalleGen => _detalleGen.stream;

  //Con este stream cargas en el stream lo que hay en detalle generacion traido del JSON
  Function(DetalleGeneracion) get addDetalleGen => _detalleGen.sink.add;


  Future<DetalleGeneracion> getData() async {
    String url = 'https://test-consolaoperaciones.azurewebsites.net';

    var response = await http
        .get(
        '$url/api/MasterDetailEstadoGen/ObtenerDetalleGeneracionSBU?sbuId=1')
        .catchError((error) => throw (error));

    DetalleGeneracion detailGeneracion;       //Instancias el modelo

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      detailGeneracion = createNewModel(jsonData);
      addDetalleGen(detailGeneracion); //Con esta linea agregaste al stream el objeto creado que luego lo utilizas en otra clase
      var detalleGen = jsonData['ListaDetalleComposite'];

      for (var u in detalleGen) {
        ///TODO
        ///por lo que veo aca creas otro detalle no se si es el mismo,
        ///si lo queres sobre escribir llamas al mismo stream y lo cargas
        ///sino lo queres sobreescribir creas otro stream y lo mandas ahi
        DetalleGeneracion detail = createNewModel(u);
        detailGeneracion.listaDetalleGeneracion.add(detail);
      }
    }
    return detailGeneracion;
  }

  //Podes hacerlo en un solo paso es mucho mas eficiente
  DetalleGeneracion createNewModel(jsonData) {
    DetalleGeneracion _detail = new DetalleGeneracion(
      id: jsonData['Id'],
      nombre: jsonData['Nombre'].toString(),
      capacidadInstalada: double.parse(jsonData['CapacidadInstalada'].toStringAsFixed(1)),
      capacidadUsada: jsonData['CapacidadUsada'].toStringAsFixed(0),
      fechaActualizacion: jsonData['FechaActualizacion'].toString(),
      generacionActual: double.parse(jsonData['GeneracionActual'].toStringAsFixed(1)),
    );
    return _detail;
  }



///Es importante que cierres los stream asi no te carga la memoria cuando no se estan usando
  void dispose() async {
    await _detalleGen.drain();
    _detalleGen.close();
  }

}

final blocDetalleGeneracion = new DetalleGeneracionBloc();
