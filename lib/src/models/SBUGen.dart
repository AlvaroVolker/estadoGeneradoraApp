class DetalleGeneracion{

  final String nombre;
  final double capacidadInstalada;
  final double capacidadUsada;
  final double generacionActual;
  final String fechaActualizacion;
  List<DetalleGeneracion> listaDetalleGeneracion;

  DetalleGeneracion({
    this.nombre,this.capacidadInstalada, this.capacidadUsada, this.generacionActual, this.fechaActualizacion,this.listaDetalleGeneracion
    }){
      this.listaDetalleGeneracion = new List<DetalleGeneracion>();
    }
}