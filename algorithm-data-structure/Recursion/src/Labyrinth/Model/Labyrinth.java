package Labyrinth.Model;

public class Labyrinth {

  public int length;
  private LabyrinthCell[][] cellMatrix;
  public Player player;

  public Labyrinth(int length, Player player) {
    this.length = length;
    this.player = player;
    this.generateCellMatrix(this.length);
  }

  public boolean movePlayerToLeft() {
    PlayerPosition playerPosition = this.player.getPosition();
    LabyrinthCell leftCeil = this.cellMatrix[playerPosition.x - 1][playerPosition.y];
    if (leftCeil == null) {
      return false;
    }

    if (leftCeil.getType() == LabyrinthCell.TYPE_WALL) {
      return false;
    }

    leftCeil.setType(LabyrinthCell.TYPE_PLAYER);
    this.player.setPosition(playerPosition.x -1, playerPosition.y);
    this.show();
    return true;

  }

  public void generateCellMatrix (int length) {
    this.cellMatrix = new LabyrinthCell[length][length];
    PlayerPosition position = this.player.getPosition();
    this.cellMatrix[position.x][position.y] = new LabyrinthCell(LabyrinthCell.TYPE_PLAYER);
//    for (Ceil[] cells : this.cellMatrix) {
//      for (Ceil cell : cells) {
//
//        System.out.print(cell.getSimbol());
//      }
//      System.out.println();
//    }
//    this.cellMatrix[0][0] = new LabyrinthCell(LabyrinthCell.TYPE_WAY);
    this.cellMatrix[0][1] = new LabyrinthCell(LabyrinthCell.TYPE_WAY);
    this.cellMatrix[0][2] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[0][3] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[0][4] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);

    this.cellMatrix[1][0] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[1][1] = new LabyrinthCell(LabyrinthCell.TYPE_WAY);
    this.cellMatrix[1][2] = new LabyrinthCell(LabyrinthCell.TYPE_WAY);
    this.cellMatrix[1][3] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[1][4] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);

    this.cellMatrix[2][0] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[2][1] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[2][2] = new LabyrinthCell(LabyrinthCell.TYPE_WAY);
    this.cellMatrix[2][3] = new LabyrinthCell(LabyrinthCell.TYPE_WAY);
    this.cellMatrix[2][4] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);

    this.cellMatrix[3][0] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[3][1] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[3][2] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[3][3] = new LabyrinthCell(LabyrinthCell.TYPE_WAY);
    this.cellMatrix[3][4] = new LabyrinthCell(LabyrinthCell.TYPE_WAY);


    this.cellMatrix[4][0] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[4][1] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[4][2] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[4][3] = new LabyrinthCell(LabyrinthCell.TYPE_WALL);
    this.cellMatrix[4][4] = new LabyrinthCell(LabyrinthCell.TYPE_END);

  }

  public void show () {
    for (LabyrinthCell[] cells: this.cellMatrix) {
      for (LabyrinthCell cell : cells) {
        System.out.print(cell.getSymbol());
      }
      System.out.println();
    }
  }

}
