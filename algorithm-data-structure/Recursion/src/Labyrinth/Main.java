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
    boolean result = l.movePlayerToRight();
    System.out.println(result);
    result = l.movePlayerToLeft();
    System.out.println(result);
  }

}
