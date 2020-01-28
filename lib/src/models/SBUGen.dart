class ListaDetalleGeneracion{

  final String nombre;
  final double capacidadInstalada;
  final double capacidadUsada;
  final double generacionActual;
  final DateTime fechaActualizacion;
  final List<ListaDetalleGeneracion> listaGen;

  ListaDetalleGeneracion({this.nombre, this.capacidadInstalada, this.capacidadUsada, this.generacionActual, this.fechaActualizacion, this.listaGen});

  factory ListaDetalleGeneracion.fromJson(Map json){
    return new ListaDetalleGeneracion(
        nombre : json['Nombre'],
        capacidadInstalada : json['CapacidadInstalada'],
        capacidadUsada: json['CapacidadUsada'],
        generacionActual : json['GeneracionActual'],
        fechaActualizacion : json['FechaActualizacion']
    );
  }


}