package company.inventarios;

import company.personal.Personal;

import java.util.Date;

public class AutorizacionSalida {

  private int codigo;
  public Personal responsable;
  public Date fechaEntrega;
  public String ubicacion;

  public AutorizacionSalida (
    int codigo,
    Personal responsable,
    Date fechaEntrega,
    String ubicacion
  ) {
    this.codigo = codigo;
    this.responsable = responsable;
    this.fechaEntrega = fechaEntrega;
    this.ubicacion = ubicacion;
  }

}
