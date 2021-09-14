package Labyrinth.Model;

public class Player {

  public static final PlayerPosition positionInitial = new PlayerPosition(0,0);

  private PlayerPosition position;

  public Player () {
    this.position = positionInitial;
  }

  public PlayerPosition getPosition () {
    return this.position;
  }

  public void setPosition (int positionX, int positionY) {
    this.position = new PlayerPosition(positionX, positionY);
  }


}
