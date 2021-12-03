package company.almacen;

import company.listas.Lista;
import company.productos.ItemAlmacen;
import company.compras.OrdenContractual;

import java.util.Date;

public class Entrada {

  public int nroEntrada;
  public Date fecha;
  public int nroFactura;
  public String proveedor;
  public OrdenContractual orden;
  public Lista items;

  public Entrada (
    int nroEntrada,
    Date fecha,
    int nroFactura,
    String proveedor,
    OrdenContractual orden,
    Lista items
  ) {
    this.nroEntrada = nroEntrada;
    this.fecha = fecha;
    this.nroFactura = nroFactura;
    this.proveedor = proveedor;
    this.orden = orden;
    this.items = items;
  }

  public double totalBienes () {
    return this.items.size;
  }

  public double montoTotal() {
    double total = 0;
    for (int i = 0; i < this.items.size; i++) {
      ItemAlmacen item = (ItemAlmacen) this.items.get(i).valor;
      total += item.valorTotal();
    }
    return total;
  }

  public boolean totalBienesCorrecto () {
    return this.totalBienes() == this.orden.totalBienes();
  }

  public boolean montoTotalCorrecto () {
    return this.montoTotal() == this.orden.montoTotalDespachado();
  }

}
