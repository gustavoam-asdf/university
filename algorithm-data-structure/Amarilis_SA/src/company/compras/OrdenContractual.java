package company.compras;

import company.listas.Lista;
import company.productos.ItemOrden;

import java.util.Date;

public class OrdenContractual {

  int nroOrden;
  String nit;
  Lista proveedores;
  Date fechaOrden;
  Date fechaRealizacion;
  Date fechaEntrega;
  Lista solicitudes;
  Lista items;

  OrdenContractual (
      int nroOrden,
      String nit,
      Lista proveedores,
      Date fechaOrden,
      Date fechaRealizacion,
      Date fechaEntrega,
      Lista solicitudes,
      Lista items
  ) {
    this.nroOrden = nroOrden;
    this.nit = nit;
    this.proveedores = proveedores;
    this.fechaOrden = fechaOrden;
    this.fechaRealizacion = fechaRealizacion;
    this.fechaEntrega = fechaEntrega;
    this.solicitudes = solicitudes;
    this.items = items;
  }

  public int totalBienes () {
    return this.items.size;
  }

  public double montoTotalSolicitado () {
    double total = 0;
    for (int i = 0; i < this.solicitudes.size; i++) {
      Solicitud s = (Solicitud) this.solicitudes.get(i).valor;
      total += s.montoTotal();
    }
    return total;
  }

  public double montoTotalDespachado () {
    double total = 0;
    for (int i = 0; i < this.items.size; i++) {
      ItemOrden item = (ItemOrden) this.items.get(i).valor;
      total += item.precioTotalDespachado();
    }
    return total;
  }

}
