package company.almacen;

import company.compras.ItemOrden;
import company.compras.OrdenContractual;

import java.util.ArrayList;
import java.util.Date;

public class Entrada {

  int nroEntrada;
  Date fecha;
  int nroFactura;
  String proveedor;
  OrdenContractual orden;
  ArrayList<ItemOrden> items;

  Entrada (
    int nroEntrada,
    Date fecha,
    int nroFactura,
    String proveedor,
    OrdenContractual orden,
    ArrayList<ItemOrden> items
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

  public double valorTotal () {
    double total = 0;
    for (ItemOrden i: this.items) {
      total += i.precioTotalDespachado();
    }
    return total;
  }

  public boolean totalBienesCorrecto () {
    return this.totalBienes() == this.orden.totalBienes();
  }

  public boolean valorTotalCorrecto () {
    return this.valorTotal() == this.orden.montoTotalDespachado();
  }

}
