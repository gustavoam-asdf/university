package Labyrinth.Model;

public class LabyrinthCell {
  public final static int TYPE_WAY = 1;
  public final static int TYPE_WALL = 2;
  public final static int TYPE_PLAYER = 3;
  public final static int TYPE_START = 4;
  public final static int TYPE_END = 5;
  private int type;
  private char symbol;

  public LabyrinthCell(int type) {
    this.setType(type);
  }

  public int getType () {
    return this.type;
  }

  public void setType(int type) {
    if (type != TYPE_WAY && type != TYPE_WALL && type != TYPE_PLAYER && type != TYPE_START && type != TYPE_END)
      throw new Error("Unrecognized type");
    this.type = type;
    if (type == TYPE_WAY) {
      this.symbol = ' ';
    } else if (type == TYPE_START) {
      this.symbol = '-';
    } else if (type == TYPE_WALL) {
      this.symbol = '#';
    } else if (type == TYPE_PLAYER) {
      this.symbol = '*';
    } else {
      this.symbol = '?';
    }
  }

  public char getSymbol() {
    return this.symbol;
  }

}
