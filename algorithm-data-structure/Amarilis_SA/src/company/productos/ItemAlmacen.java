package company.productos;

public class ItemAlmacen extends Item{

  public double cantidad;

  public ItemAlmacen(
    int codigo,
    String nombreProducto,
    double precioUnitario,
    String unidadMedida,
    double cantidad
  ) {
    super(codigo, nombreProducto, precioUnitario, unidadMedida);
    this.cantidad = cantidad;
  }
  public ItemAlmacen(
    int codigo,
    String nombreProducto,
    double cantidad
  ) {
    super(codigo, nombreProducto, 0, "");
    this.cantidad = cantidad;
  }

  public double valorTotal () {
    return this.precioUnitario * this.cantidad;
  }

}
