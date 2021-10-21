package utils.sort;

import company.inventarios.Inventario;
import company.listas.Nodo;
import company.productos.ItemAlmacen;

public class Bubble {
  public static void ordenar(Inventario inventario, boolean ascendentemente) {
    for (int i = 0; i < inventario.items.size; i++) {
      for (int j = 0; j < inventario.items.size - 1; j++) {
        Nodo nodoActual = inventario.items.get(j);
        String itemActual = ((ItemAlmacen) nodoActual.valor).nombreProducto;
        String itemSiguiente = ((ItemAlmacen) nodoActual.siguiente.valor).nombreProducto;
        if (ascendentemente ? itemActual.compareTo(itemSiguiente) > 0 : itemActual.compareTo(itemSiguiente) < 0) {
          ItemAlmacen value = (ItemAlmacen) nodoActual.valor;
          nodoActual.valor = nodoActual.siguiente.valor;
          nodoActual.siguiente.valor = value;
        }
      }
    }
  }
}
