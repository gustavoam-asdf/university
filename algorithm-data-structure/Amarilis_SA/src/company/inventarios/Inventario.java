package company.inventarios;

import company.almacen.Entrada;
import company.almacen.Salida;
import company.listas.Lista;
import company.productos.ItemAlmacen;

public class Inventario {
  public Lista items;

  public Inventario(Lista items) {
    this.items = items;
  }

  public boolean sacarProductos (Salida salida) {
    if (!salida.estaAutorizado) return false;

    for (int i = 0; i < this.items.size; i++) {
      ItemAlmacen itemInventario = (ItemAlmacen) this.items.get(i).valor;
      for (int j = 0; j < salida.items.size; j++) {
        ItemAlmacen itemSalida = (ItemAlmacen) salida.items.get(j).valor;
        if (itemInventario.codigo == itemSalida.codigo) {
          System.out.println("==============================================");
          System.out.println("Salen " + itemSalida.cantidad + " de " + itemInventario.nombreProducto);
          System.out.println("==============================================");
          itemInventario.cantidad -= itemSalida.cantidad;
        }
      }
    }
    return true;
  }

  public boolean ingresarProductos (Entrada entrada) {
    for (int i = 0; i < this.items.size; i++) {
      ItemAlmacen itemInventario = (ItemAlmacen) this.items.get(i).valor;
      for (int j = 0; j < entrada.items.size; j++) {
        ItemAlmacen itemSalida = (ItemAlmacen) entrada.items.get(j).valor;
        if (itemInventario.codigo == itemSalida.codigo) {
          System.out.println("==============================================");
          System.out.println("Entran " + itemSalida.cantidad + " de " + itemInventario.nombreProducto);
          System.out.println("==============================================");
          itemInventario.cantidad += itemSalida.cantidad;
        }
      }
    }
    return true;
  }
}
