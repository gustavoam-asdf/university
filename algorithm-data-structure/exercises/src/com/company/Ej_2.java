package com.company;

import java.util.Scanner;

public class Ej_2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("Ingrese un número entero distinto a cero: ");
		int n = sc.nextInt();
		if (n == 0) {
			System.out.print("No puede ingresar 0");
			return;
		}

		System.out.printf("Los divisores de %d son:\n", n);
		for (int i = 1; i <= n; i++) {
			if (n % i == 0) {
				System.out.println(i);
			}
		}
	}
}
