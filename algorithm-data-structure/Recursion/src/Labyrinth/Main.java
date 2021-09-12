package Labyrinth;

import Labyrinth.Model.Labyrinth;
import Labyrinth.Model.Player;

public class Main {

  public static void main(String[] args) {
//    Ceil[] ceils = new Ceil[3];
//    for (int i = 0; i < ceils.length; i++) {
//      ceils[i] = new Ceil(Ceil.TYPE_WALL);
//    }
//
//    for (Ceil c: ceils) {
//      System.out.print(c.getSimbol());
//    }
//    System.out.println();
//    for (Ceil c: ceils) {
//      System.out.print(c.getSimbol());
//    }

    Player p = new Player();
    Labyrinth l = new Labyrinth(5, p);
    l.show();
  }

}
