package company;

import company.almacen.Salida;
import company.inventarios.AutorizacionSalida;
import company.inventarios.Inventario;
import company.listas.Lista;
import company.personal.Personal;
import company.productos.ItemAlmacen;
import utils.sort.Bubble;

import java.util.Date;
import java.util.Scanner;

public class Main {

  public static void main(String[] args) {
//    Scanner sc = new Scanner(System.in);
//    System.out.printf("====== %s ======", "Amarilis S.A");
//    int option = 0;
//    do {
//      System.out.println("\nÁreas: ");
//      System.out.println("1. Compras");
//      System.out.println("2. Almacen");
//      System.out.println("3. Inventario");
//      System.out.print("Opción: ");
//      option = sc.nextInt();
//    } while (!(option >= 1 && option <= 3));

//    Lista itemsInventario = new Lista();
//
//    itemsInventario.add(new ItemAlmacen(0, "papeles", 8.50, "millar", 100));
//    itemsInventario.add(new ItemAlmacen(1, "impresoras", 150, "unidad", 10));
//    itemsInventario.add(new ItemAlmacen(2, "computadora", 1400, "unidad", 10));
//    itemsInventario.add(new ItemAlmacen(3, "lapiz", 0.50, "unidad", 1000));
//    itemsInventario.add(new ItemAlmacen(4, "escritorios", 200, "unidad", 15));
//
//    Inventario inventario = new Inventario(itemsInventario);
//    Personal p = new Personal(71661497, "Gustavo", "Atencio");
//
//    Lista itemsSalida = new Lista();
//
//    itemsSalida.add(new ItemAlmacen(0, "papeles", 10));
//    itemsSalida.add(new ItemAlmacen(1, "impresoras", 3));
//    itemsSalida.add(new ItemAlmacen(2, "computadora", 1));
//    itemsSalida.add(new ItemAlmacen(3, "lapiz", 300));
//    itemsSalida.add(new ItemAlmacen(4, "escritorios", 5));
//
//    Salida salida = new Salida(0, p, new Date(), new Date("25/09/2021"), itemsSalida);
//    AutorizacionSalida autorizacion = new AutorizacionSalida(0, p, new Date("25/09/2021"), "Jr. Abtao 1001");
//    salida.autorizar(autorizacion);
//
//    mostrarItemsInvetario(inventario);
//
//    System.out.println();
//    System.out.println();
//
//    inventario.sacarProductos(salida);
//
//    System.out.println();
//    System.out.println();
//
//    mostrarItemsInvetario(inventario);

    Lista itemsInventario = new Lista();

    itemsInventario.add(new ItemAlmacen(0, "papeles", 8.50, "millar", 100));
    itemsInventario.add(new ItemAlmacen(1, "impresoras", 150, "unidad", 10));
    itemsInventario.add(new ItemAlmacen(2, "computadora", 1400, "unidad", 10));
    itemsInventario.add(new ItemAlmacen(3, "lapiz", 0.50, "unidad", 1000));
    itemsInventario.add(new ItemAlmacen(4, "escritorios", 200, "unidad", 15));

    Inventario inventario = new Inventario(itemsInventario);
    System.out.println("=====================Productos antes=====================");
    mostrarItemsInvetario(inventario);

    System.out.println();
    System.out.println("====================Productos despues====================");

    Bubble.ordenar(inventario, true);

    mostrarItemsInvetario(inventario);


  }

  public static void mostrarItemsInvetario (Inventario inventario) {
    for (int i = 0; i < inventario.items.size; i++) {
      System.out.println("==============================================");
      ItemAlmacen item = (ItemAlmacen) inventario.items.get(i).valor;
      System.out.println("Codigo:           " + item.codigo);
      System.out.println("Nombre:           " + item.nombreProducto);
      System.out.println("Precio unitario:  " + item.precioUnitario);
      System.out.println("Unidad medida:    " + item.unidadMedida );
      System.out.println("Cantidad:         " + item.cantidad);
    }
  }

}
