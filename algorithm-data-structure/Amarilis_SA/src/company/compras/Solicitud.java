package company.compras;

import company.listas.Lista;
import company.personal.Personal;
import company.productos.ItemSolicitud;

import java.util.Date;

public class Solicitud {

  public int nroSolicitud;
  public Date fecha;
  public Personal responsable;
  public AutorizacionSolicitud autorizacion;
  public double rubroPresupuestal;
  public Lista items ;

  Solicitud (
    int nroSolicitud,
    Date fecha,
    Personal responsable,
    AutorizacionSolicitud autorizacion,
    int rubroPresupuestal,
    Lista items
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
    for (int i = 0; i < this.items.size; i++) {
      ItemSolicitud item = (ItemSolicitud) this.items.get(i).valor;
      total += item.precioTotalSolicitado();
    }
    return total;
  }
}
