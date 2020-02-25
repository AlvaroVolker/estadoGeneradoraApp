class DetalleGeneracion {
  int id;
  String nombre;
  double capacidadInstalada;
  String capacidadUsada;
  double generacionActual;
  String fechaActualizacion;
  List<DetalleGeneracion> listaDetalleGeneracion;

  DetalleGeneracion({
    this.id,
    this.nombre,
    this.capacidadInstalada,
    this.capacidadUsada,
    this.generacionActual,
    this.fechaActualizacion,
    this.listaDetalleGeneracion,
  }) {
    this.listaDetalleGeneracion = new List<DetalleGeneracion>();
  }

  DetalleGeneracion.fromJsonMap(Map<String, dynamic> json) {
    id = json['Id'];
    nombre = json['Nombre'].toString();
    capacidadInstalada =
        double.parse(json['CapacidadInstalada'].toString()).isNaN
            ? 0
            : double.parse(json['CapacidadInstalada'].toStringAsFixed(1));
    capacidadUsada = !double.parse(json['CapacidadUsada'].toString()).isNaN
        ? json['CapacidadUsada'].toStringAsFixed(0)
        : "0";
    generacionActual = double.parse(json['GeneracionActual'].toString()).isNaN
        ? 0
        : double.parse(json['GeneracionActual'].toStringAsFixed(1));
    fechaActualizacion = json['FechaActualizacion'].toString();
  }
}
