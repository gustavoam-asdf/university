package Labyrinth.Model;

public class Ceil {
  public final static int TYPE_WAY = 1;
  public final static int TYPE_WALL = 2;
  private int type;
  private char simbol;

  public Ceil(int type) {
    this.setType(type);
  }

  public int getType () {
    return this.type;
  }

  public void setType(int type) {
    if (type != TYPE_WAY && type != TYPE_WALL) throw new Error("Unrecognized type");
    this.type = type;
    if (type == TYPE_WAY) {
      this.simbol = '\u3000';
    } else {
      this.simbol = '▮';
    }
  }

  public char getSimbol () {
    return this.simbol;
  }

}
