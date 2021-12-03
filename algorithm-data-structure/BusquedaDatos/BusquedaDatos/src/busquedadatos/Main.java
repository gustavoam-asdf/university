package busquedadatos;

import java.io.IOException;
import jxl.read.biff.BiffException;

public class Main {

  private static final String UBICACION_ARCHIVO_EXCEL = "C:/Users/GUSTAVO/Desktop/all/github.com/university/algorithm-data-structure/BusquedaDatos/DATOS_PERSONA.xls"; //Fichero de datos (Solo lee ficheros en .xls)
  
  public static void main(String[] args) throws IOException, BiffException {
    
    // Leemos los archivos del excel
    String[][] datos = Excel.leer(UBICACION_ARCHIVO_EXCEL);
    
    // Almacenamos los datos del archivo en un arreglo de personas
    Persona[] personas = new Persona[datos.length - 1];
    for (int i = 1; i < datos.length; i++) {
      personas[i - 1] = new Persona(datos[i]);
    }
    
    busquedaSecuencial(personas, Persona.CAMPO_APELLIDOS, "ARRIETA NIEVES");
    System.out.println();
    
    busquedaSecuencial(personas, Persona.CAMPO_APELLIDOS, "CONDEZO");
    System.out.println();
    
    busquedaSecuencial(personas, Persona.CAMPO_APELLIDOS, "CONDEZAO");
    System.out.println();

    busquedaSecuencial(personas, Persona.CAMPO_NOMBRES, "MONICA");
    System.out.println();
    
    busquedaSecuencial(personas, Persona.CAMPO_DNI, "70524430");
    System.out.println();
    
    busquedaBinaria(personas, Persona.CAMPO_DNI, "2264000915");
    System.out.println();
    
    busquedaBinaria(personas, Persona.CAMPO_APELLIDOS, "TOLENTINO HIPOLO");
    System.out.println();
    
    busquedaBinaria(personas, Persona.CAMPO_NOMBRES, "LESLY PAULA");
    System.out.println();
  }
  
  public static void busquedaSecuencial (Persona[] personas, String campo, String valorBuscado) {
    boolean encontrado = false;
    valorBuscado = valorBuscado.toUpperCase();
    // Recorremos el arreglo de personas
    for (Persona p: personas) {
      String valorPersona = p.valueByCampo(campo).toUpperCase();
      // Muestra en pantalla si encuentra algun valor
      if (valorPersona.toUpperCase().contains(valorBuscado)) {
        System.out.println("============================");
        System.out.println("Con " + campo + " " + valorBuscado + " se a encontrado a:");
        p.print();
        System.out.println("============================");
        encontrado = true;
      }
    }
    
    if (!encontrado) {
      System.out.println("============================");
      System.out.println("No se ah encontrado a nadie de " + campo + " igual a " + valorBuscado);
      System.out.println("============================");
    }
  }
  
  public static void busquedaBinaria(Persona[] personas, String campo, String valorBuscado) {
    // Ordenamos el arreglo de personas de acuerdo al campo que se usará
    Persona[] personasOrdenadas = personas;
    Burbuja.ordenar(personasOrdenadas, campo, true);
    
    valorBuscado = valorBuscado.toUpperCase();
    
    int posicionInferior = 0;
    int posicionSuperior = personas.length - 1;
    boolean encontrado = false;
    
    while (posicionInferior <= posicionSuperior) {
      int posicionMedia = (posicionInferior + posicionSuperior) / 2;
      String valorCentral = personasOrdenadas[posicionMedia].valueByCampo(campo).toUpperCase();
      
      if (valorCentral.equals(valorBuscado)) {
        System.out.println("============================");
        System.out.println("Con " + campo + " " + valorBuscado + " se a encontrado a:");
        personasOrdenadas[posicionMedia].print();
        encontrado = true;
        System.out.println("============================");
        break;
      } else if (valorCentral.compareTo(valorBuscado) > 0) {
        // Esta antes del valor central
        posicionSuperior = posicionMedia - 1;
      } else if (valorCentral.compareTo(valorBuscado) < 0) {
        // Esta despues del valor central
        posicionInferior = posicionMedia + 1;
      }
    }
    
    if (!encontrado) {
      System.out.println("============================");
      System.out.println("No se ah encontrado a nadie de " + campo + " igual a " + valorBuscado);
      System.out.println("============================");
    }
    
  }

}
