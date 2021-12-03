package busquedadatos;
public class Persona {
  
  public static final String CAMPO_APELLIDOS = "apellidos";
  public static final String CAMPO_NOMBRES = "nombre";
  public static final String CAMPO_DNI = "DNI";
  
  public String id;
  public String apellidoPaterno;
  public String apellidoMaterno;
  public String nombres;
  public String DNI;

  public Persona(String id, String apellidoPaterno, String apellidoMaterno, String nombres, String DNI) {
    this.id = id;
    this.apellidoPaterno = apellidoPaterno;
    this.apellidoMaterno = apellidoMaterno;
    this.nombres = nombres;
    this.DNI = DNI;
  }
  
  public Persona(String[] datos){
    this.id = datos[0];
    this.apellidoPaterno = datos[1];
    this.apellidoMaterno = datos[2];
    this.nombres = datos[3];
    this.DNI = datos[4];  
  }
  
  public void print() {
    System.out.println("Apellidos: " + this.apellidoPaterno + " " + this.apellidoMaterno);
    System.out.println("Nombre:    " + this.nombres);
    System.out.println("DNI:       " + this.DNI);
  }
  
  public String valueByCampo (String campo) {
    switch (campo) {
      case Persona.CAMPO_APELLIDOS -> {
        return this.apellidoPaterno + " " + this.apellidoMaterno;
      }
      case Persona.CAMPO_NOMBRES -> {
        return this.nombres;
      }
      case Persona.CAMPO_DNI -> {
        return this.DNI;
      }
      default -> {}
    }
    return "";
  }
  
}
