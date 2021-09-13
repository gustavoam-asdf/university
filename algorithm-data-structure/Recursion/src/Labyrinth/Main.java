package Labyrinth;

import Labyrinth.Model.Labyrinth;
import Labyrinth.Model.Player;

import java.util.Scanner;

public class Main {

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    Player p = new Player();
    Labyrinth l = new Labyrinth(5, p);
    l.show();
    boolean exit = false;

    while (!exit) {
      System.out.print("""
        A dónde quiere moverse:
          (W)     Arriba
          (A)     Izquierda
          (S)     Abajo
          (D)     Derecha
          (Otro)  Salir
        ->""");

      char response = sc.next().toLowerCase().charAt(0);

      switch (response) {
        case 'w' -> l.movePlayerToUp();
        case 'a' -> l.movePlayerToLeft();
        case 's' -> l.movePlayerToBottom();
        case 'd' -> l.movePlayerToRight();
        default -> exit = true;
      }
    }
    sc.close();
  }

}
