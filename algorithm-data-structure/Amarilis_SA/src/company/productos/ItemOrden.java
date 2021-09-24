package company.productos;

public class ItemOrden extends Item{

  double cantidadSolicitada;
  double cantidadDespachada;

  ItemOrden(
      int codigo,
      String nombreProducto,
      double precioUnitario,
      String unidadMedida,
      double cantidadSolicitada,
      double cantidadDespachada
  ) {
    super(codigo, nombreProducto, precioUnitario, unidadMedida);
    this.cantidadSolicitada = cantidadSolicitada;
    this.cantidadDespachada = cantidadDespachada;
  }

  public double precioTotalSolicitado () {
    return  this.cantidadSolicitada * this.precioUnitario;
  }

  public double precioTotalDespachado () {
    return  this.cantidadDespachada * this.precioUnitario;
  }

}
