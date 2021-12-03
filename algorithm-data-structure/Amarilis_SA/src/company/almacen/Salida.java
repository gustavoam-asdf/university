package company.almacen;

import company.inventarios.AutorizacionSalida;
import company.listas.Lista;
import company.personal.Personal;

import java.util.Date;

public class Salida {

  private int nroSalida;
  public Date fechaSalida;
  public Personal responsable;
  public Date fechaEntrega;
  public AutorizacionSalida autorizacion;
  public boolean estaAutorizado;
  public Lista items;

  public Salida (
    int nroSalida,
    Personal responsable,
    Date fechaSalida,
    Date fechaEntrega,
    Lista items
  ) {
    this.nroSalida = nroSalida;
    this.responsable = responsable;
    this.fechaSalida = fechaSalida;
    this.fechaEntrega = fechaEntrega;
    this.estaAutorizado = false;
    this.items = items;
  }

  public void autorizar (AutorizacionSalida autorizacion) {
    this.autorizacion = autorizacion;
    this.estaAutorizado = true;
  }

}
