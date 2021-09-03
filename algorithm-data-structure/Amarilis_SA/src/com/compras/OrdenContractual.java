package com.compras;

import java.lang.reflect.Array;
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

  public double montoTotal () {
    double total = 0;
    for (Solicitud s: this.solicitudes) {
      total += s.montoTotal();
    }
    return total;
  }

}