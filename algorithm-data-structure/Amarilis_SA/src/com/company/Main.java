package com.company;

import java.util.Scanner;

public class Main {

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    System.out.printf("====== %s ======", "Amarilis S.A");
    int option = 0;
    do {
      System.out.println("\nÁreas: ");
      System.out.println("1. Compras");
      System.out.println("2. Almacen");
      System.out.println("3. Inventario");
      System.out.print("Opción: ");
      option = sc.nextInt();
    } while (!(option >= 1 && option <= 3));

  }

}
