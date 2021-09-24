package company.almacen;

import company.personal.Personal;
import company.productos.ItemAlmacen;

import java.util.ArrayList;
import java.util.Date;

public class Salida {

  int nroSalida;
  Personal responsable;
  Date fechaSalida;
  Date fechaEntrega;
  ArrayList<ItemAlmacen> items;

  Salida (
    int nroSalida,
    Personal responsable,
    Date fechaSalida,
    Date fechaEntrega,
    ArrayList<ItemAlmacen> items
  ) {
    this.nroSalida = nroSalida;
    this.responsable = responsable;
    this.fechaSalida = fechaSalida;
    this.fechaEntrega = fechaEntrega;
    this.items = items;
  }

}
