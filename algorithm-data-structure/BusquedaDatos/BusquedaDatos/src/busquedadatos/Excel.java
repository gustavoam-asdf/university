package busquedadatos;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.File;
import java.io.IOException;

public class Excel {


  public static String[][] leer(String FILE_LOCATION) throws IOException, BiffException {
    Workbook workbook = Workbook.getWorkbook(new File(FILE_LOCATION));      //Pasamos el excel que vamos a leer
    Sheet sheet = workbook.getSheet(1);                                     //Seleccionamos la hoja que vamos a leer
 
    String[][] datos = new String[sheet.getRows()][sheet.getColumns()];
    for (int fila = 1; fila < sheet.getRows(); fila++) {                    //recorremos las filas
      for (int columna = 0; columna < sheet.getColumns(); columna++) {      //recorremos las columnas
        datos[fila][columna] = sheet.getCell(columna, fila).getContents();  //setear la celda leida a los datos correspondientes
      }
    }
    
    return datos;
  }
}