package com.compras;

import java.util.ArrayList;
import java.util.Date;

public class OrdenContractual {

  int nroOrden;
  String nit;
  String nombreProveedor;
  Date fechaOrden;
  Date fechaRealizacion;
  Date fechaEntrega;
  ArrayList <Solicitud> solicitudes;
  ArrayList <ItemOrden> items;

  OrdenContractual (
      int nroOrden,
      String nit,
      String nombreProveedor,
      Date fechaOrden,
      Date fechaRealizacion,
      Date fechaEntrega,
      ArrayList <Solicitud> solicitudes,
      ArrayList <ItemOrden> items
  ) {
    this.nroOrden = nroOrden;
    this.nit = nit;
    this.nombreProveedor = nombreProveedor;
    this.fechaOrden = fechaOrden;
    this.fechaRealizacion = fechaRealizacion;
    this.fechaEntrega = fechaEntrega;
    this.solicitudes = solicitudes;
    this.items = items;
  }

  public int totalBienes () {
    return this.items.size();
  }

  public double montoTotalSolicitado () {
    double total = 0;
    for (Solicitud s: this.solicitudes) {
      total += s.montoTotal();
    }
    return total;
  }

  public double montoTotalDespachado () {
    double total = 0;
    for (ItemOrden i: this.items) {
      total += i.precioTotalDespachado();
    }
    return total;
  }

}
