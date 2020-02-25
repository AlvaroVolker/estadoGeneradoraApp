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

}
