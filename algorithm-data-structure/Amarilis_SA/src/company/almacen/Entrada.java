package company.almacen;

import company.productos.ItemAlmacen;
import company.compras.OrdenContractual;

import java.util.ArrayList;
import java.util.Date;

public class Entrada {

  int nroEntrada;
  Date fecha;
  int nroFactura;
  String proveedor;
  OrdenContractual orden;
  ArrayList<ItemAlmacen> items;

  Entrada (
    int nroEntrada,
    Date fecha,
    int nroFactura,
    String proveedor,
    OrdenContractual orden,
    ArrayList<ItemAlmacen> items
  ) {
    this.nroEntrada = nroEntrada;
    this.fecha = fecha;
    this.nroFactura = nroFactura;
    this.proveedor = proveedor;
    this.orden = orden;
    this.items = items;
  }

  public double totalBienes () {
    return this.items.size();
  }

  public double montoTotal() {
    double total = 0;
    for (ItemAlmacen i: this.items) {
      total += i.valorTotal();
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
