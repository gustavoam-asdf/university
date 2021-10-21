package utils.sort;

public class Bubble {
  private static void ordenar(int[] array, boolean ascendentemente) {
    for (int i = 0; i < array.length; i++) {
      for (int j = 0; j < array.length - 1; j++) {
        int itemActual = array[j];
        int itemSiguiente = array[j + 1];
        if (ascendentemente ? itemActual > itemSiguiente : itemActual < itemSiguiente) {
          array[j] = itemSiguiente;
          array[j + 1] = itemActual;
        }
      }
    }
  }

  private static void ordenar(String[] array, boolean ascendentemente) {
    for (int i = 0; i < array.length; i++) {
      for (int j = 0; j < array.length - 1; j++) {
        String itemActual = array[j];
        String itemSiguiente = array[j + 1];
        if (ascendentemente ? itemActual.compareTo(itemSiguiente) > 0 : itemActual.compareTo(itemSiguiente) < 0) {
          array[j] = itemSiguiente;
          array[j + 1] = itemActual;
        }
      }
    }
  }
}
