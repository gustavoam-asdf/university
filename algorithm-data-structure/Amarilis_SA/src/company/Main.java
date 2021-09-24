package company;

import company.inventarios.Inventario;
import company.listas.Lista;
import company.productos.ItemAlmacen;

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

    int codigoProducto = 0;
    Lista items = new Lista();

    items.add(new ItemAlmacen(codigoProducto++, "papeles", 8.50, "millar", 100));
    items.add(new ItemAlmacen(codigoProducto++, "impresoras", 150, "unidad", 10));
    items.add(new ItemAlmacen(codigoProducto++, "computadora", 1400, "unidad", 10));
    items.add(new ItemAlmacen(codigoProducto++, "lapiz", 0.50, "unidad", 1000));
    items.add(new ItemAlmacen(codigoProducto, "escritorios", 200, "unidad", 15));

    Inventario inventario = new Inventario(items);

    System.out.println(((ItemAlmacen) items.get(4).valor).cantidad);

  }

}
