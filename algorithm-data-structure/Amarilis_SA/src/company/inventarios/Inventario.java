package company.inventarios;

import company.almacen.Entrada;
import company.almacen.Salida;
import company.listas.Lista;
import company.productos.ItemAlmacen;

public class Inventario {
  Lista items;

  public Inventario(Lista items) {
    this.items = items;
  }

  public boolean sacarProductos (Salida salida) {
    if (!salida.estaAutorizado) return false;

    for (int i = 0; i < this.items.size; i++) {
      ItemAlmacen itemInventario = (ItemAlmacen) this.items.get(i).valor;
      for (int j = 0; j < salida.items.size; j++) {
        ItemAlmacen itemSalida = (ItemAlmacen) this.items.get(i).valor;
        if (itemInventario.codigo == itemSalida.codigo) {
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
        ItemAlmacen itemSalida = (ItemAlmacen) this.items.get(i).valor;
        if (itemInventario.codigo == itemSalida.codigo) {
          itemInventario.cantidad += itemSalida.cantidad;
        }
      }
    }
    return true;
  }
}
