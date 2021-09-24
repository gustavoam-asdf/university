package company.compras;

import company.personal.Personal;
import company.productos.ItemSolicitud;

import java.util.ArrayList;
import java.util.Date;

public class Solicitud {

  public int nroSolicitud;
  public Date fecha;
  public Personal responsable;
  public AutorizacionSolicitud autorizacion;
  public double rubroPresupuestal;
  public ArrayList<ItemSolicitud> items ;

  Solicitud (
    int nroSolicitud,
    Date fecha,
    Personal responsable,
    AutorizacionSolicitud autorizacion,
    int rubroPresupuestal,
    ArrayList<ItemSolicitud> items
  ) {
    this.nroSolicitud = nroSolicitud;
    this.fecha = fecha;
    this.responsable = responsable;
    this.autorizacion = autorizacion;
    this.rubroPresupuestal = rubroPresupuestal;
    this.items = items;
  }

  public double montoTotal() {
    double total = 0;
    for (ItemSolicitud i : this.items) {
      total += i.precioTotalSolicitado();
    }
    return total;
  }
}
