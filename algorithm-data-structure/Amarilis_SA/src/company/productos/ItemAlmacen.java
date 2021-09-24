package company.productos;

public class ItemAlmacen extends Item{

  double cantidad;

  ItemAlmacen(
    int codigo,
    String nombreProducto,
    double precioUnitario,
    String unidadMedida,
    double cantidad
  ) {
    super(codigo, nombreProducto, precioUnitario, unidadMedida);
    this.cantidad = cantidad;
  }

  public double valorTotal () {
    return this.precioUnitario * this.cantidad;
  }

}
