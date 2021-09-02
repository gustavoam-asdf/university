package com.company;

import java.util.Scanner;

public class Ej_1 {

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    System.out.print("Ingrese las unidades de producción: ");
    int production = sc.nextInt();
    String result = (production >= 100) ?  "mayor al promedio, recibe incentivos" : "menor al promedio, no recibe incentivos";
    System.out.printf("El trabajador obtuvo una producción %s", result);
  }
}
