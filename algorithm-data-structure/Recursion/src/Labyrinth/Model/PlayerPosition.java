package Labyrinth.Model;

public class PlayerPosition {

  public int x;
  public int y;

  PlayerPosition (int positionX,int positionY) {
    this.x = positionX;
    this.y = positionY;
  }

  public String get () {
    return "x: " + this.x + ", y: " + this.y;
  }

}
