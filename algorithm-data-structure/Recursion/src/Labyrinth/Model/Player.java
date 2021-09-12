package Labyrinth.Model;

public class Player {

  private PlayerPosition position;

  public Player () {
    this.position = new PlayerPosition(0, 0);
  }

  public PlayerPosition getPosition () {
    return this.position;
  }

  public void setPosition (int positionX, int positionY) {
    this.position = new PlayerPosition(positionX, positionY);
  }


}
