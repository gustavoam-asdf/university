package company.inventarios;

import company.almacen.Entrada;
import company.almacen.Salida;
import company.productos.ItemAlmacen;

import java.util.ArrayList;

public class Inventario {
  ArrayList<ItemAlmacen> items;

  Inventario(ArrayList<ItemAlmacen> items) {
    this.items = items;
  }

  public boolean sacarProductos (Salida salida) {
    if (!salida.estaAutorizado) return false;
    this.items.forEach(itemInventario -> {
      salida.items.forEach(itemSalida -> {
        if (itemInventario.codigo == itemSalida.codigo) {
          itemInventario.cantidad -= itemSalida.cantidad;
        }
      });
    });
    return true;
  }

  public boolean ingresarProductos (Entrada entrada) {
    this.items.forEach(itemInventario -> {
      entrada.items.forEach(itemSalida -> {
        if (itemInventario.codigo == itemSalida.codigo) {
          itemInventario.cantidad += itemSalida.cantidad;
        }
      });
    });
    return true;
  }
}
