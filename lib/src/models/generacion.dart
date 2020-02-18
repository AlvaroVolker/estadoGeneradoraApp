class DetalleGeneracion{

  final int id;
  final String nombre;
  final double capacidadInstalada;
  final String capacidadUsada;
  final double generacionActual;
  final String fechaActualizacion;
  List<DetalleGeneracion> listaDetalleGeneracion;

  DetalleGeneracion({
    this.id, this.nombre,this.capacidadInstalada, this.capacidadUsada, this.generacionActual, this.fechaActualizacion,this.listaDetalleGeneracion,
    }){
      this.listaDetalleGeneracion = new List<DetalleGeneracion>();
    }
}