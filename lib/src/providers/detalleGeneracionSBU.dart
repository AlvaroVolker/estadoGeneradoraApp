import 'dart:convert';
import 'package:estadogeneradoraapp/src/models/SBUGen.dart';
import 'package:http/http.dart' as http;

class _DetalleGeneracionProvider{
  String nombre;
  String fechaActualizacion;
  double generacionActual;
  double capacidadInstalada;
  double capacidadUsada;
  DetalleGeneracion detailGeneracion;

  _DetalleGeneracionProvider(){
    getData();
  }

  Future <DetalleGeneracion> getData() async {

     var response = await http.get('https://test-consolaoperaciones.azurewebsites.net/api/MasterDetailEstadoGen/ObtenerDetalleGeneracionSBU?sbuId=1');

      if(response.statusCode == 200){

          var jsonData = json.decode(response.body);
           jsonDataAsign(jsonData);
           detailGeneracion = new DetalleGeneracion(nombre: nombre, fechaActualizacion: fechaActualizacion, generacionActual: generacionActual, capacidadInstalada: capacidadInstalada, capacidadUsada: capacidadUsada );
          var detalleGen = jsonData['ListaDetalleComposite'];

          for(var u in detalleGen){

             nombre = u['Nombre'].toString();
             capacidadInstalada =double.parse(u['CapacidadInstalada'].toString());
             capacidadUsada =  double.parse(u['CapacidadUsada'].toString());
             fechaActualizacion = u['FechaActualizacion'].toString();
             generacionActual = double.parse(u['GeneracionActual'].toString());

            DetalleGeneracion detail = new DetalleGeneracion(
              nombre: nombre,
              capacidadInstalada: capacidadInstalada,
              capacidadUsada: capacidadUsada,
              fechaActualizacion: fechaActualizacion,
              generacionActual: generacionActual,
            );
            detailGeneracion.listaDetalleGeneracion.add(detail);
          }
      }
      return detailGeneracion;
  }

  void jsonDataAsign(jsonData) {
    nombre = jsonData['Nombre'].toString();
    fechaActualizacion = (jsonData['FechaActualizacion'].toString());
    generacionActual = double.parse(jsonData['GeneracionActual'].toString());
    capacidadInstalada = double.parse(jsonData['CapacidadInstalada'].toString());
    capacidadUsada = double.parse(jsonData['CapacidadUsada'].toString());
  }
}


final detalleGeneracion = new _DetalleGeneracionProvider();