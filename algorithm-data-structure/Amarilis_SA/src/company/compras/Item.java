package company.compras;


public class Item {

  public int codigo;
  public String nombreProducto;
  public double precioUnitario;
  public String unidadMedida;

  Item(int codigo, String nombreProducto, double precioUnitario, String unidadMedida) {
    this.codigo = codigo;
    this.nombreProducto = nombreProducto;
    this.precioUnitario = precioUnitario;
    this.unidadMedida = unidadMedida;
  }

}
