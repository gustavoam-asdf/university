package company.productos;

public class ItemSolicitud extends Item{

  double cantidadSolicitada;

  ItemSolicitud(
      int codigo,
      String nombreProducto,
      double precioUnitario,
      String unidadMedida,
      double cantidadSolicitada
  ) {
    super(codigo, nombreProducto, precioUnitario, unidadMedida);
    this.cantidadSolicitada = cantidadSolicitada;
  }

  public double precioTotalSolicitado() {
    return  this.cantidadSolicitada * this.precioUnitario;
  }

}
