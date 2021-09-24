package company;

import company.listas.Lista;

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

    Lista l = new Lista();
    l.add(1);
    l.add(2);
    l.add("valor");
    l.add(3);
    l.add(4);
    l.add("hola");
    l.add(5);
    l.add(6);
    l.add("otro valor");
    l.add(7);
    l.add(8);

    System.out.println(l.get(11).valor);
//    l.mostrar();


  }

}
