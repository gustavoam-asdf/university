package Labyrinth.Model;

import Labyrinth.Lib.ClearScreen;

public class Labyrinth {

  public int length;
  private LabyrinthCell[][] cellMatrix;
  public Player player;

  public Labyrinth(int length, Player player) {
    this.length = length;
    this.player = player;
    this.generateCellMatrix(this.length);
  }

  private boolean movePlayer(PlayerPosition targetPosition) {
    if (targetPosition.x < 0 || targetPosition.y < 0 ) return false;
    if (targetPosition.x >= this.length || targetPosition.y >= this.length ) return false;
    PlayerPosition currentPosition = this.player.getPosition();
    LabyrinthCell targetCell = this.cellMatrix[targetPosition.x][targetPosition.y];
    if (targetCell.getType() == LabyrinthCell.TYPE_WALL) return false;
    if (currentPosition.x == 0 && currentPosition.y == 0) {
      this.cellMatrix[currentPosition.x][currentPosition.y].setType(LabyrinthCell.TYPE_START);
    } else {
      this.cellMatrix[currentPosition.x][currentPosition.y].setType(LabyrinthCell.TYPE_WAY);
    }
    targetCell.setType(LabyrinthCell.TYPE_PLAYER);
    this.player.setPosition(targetPosition.x, targetPosition.y);
    ClearScreen.run();
    this.show();
    return true;
  }

  public void movePlayerToLeft() {
    PlayerPosition currentPosition = this.player.getPosition();
    PlayerPosition targetPosition = new PlayerPosition(currentPosition.x, currentPosition.y - 1);
    boolean canMove = movePlayer(targetPosition);
    if (!canMove) {
      System.out.println("No puedes moverte hacia la izquierda");
      this.show();
    }
  }

  public void movePlayerToRight() {
    PlayerPosition currentPosition = this.player.getPosition();
    PlayerPosition targetPosition = new PlayerPosition(currentPosition.x, currentPosition.y + 1);
    boolean canMove = movePlayer(targetPosition);
    if (!canMove) {
      System.out.println("No puedes moverte hacia la derecha");
      this.show();
    }
  }

  public void movePlayerToUp() {
    PlayerPosition currentPosition = this.player.getPosition();
    PlayerPosition targetPosition = new PlayerPosition(currentPosition.x - 1, currentPosition.y);
    boolean canMove = movePlayer(targetPosition);
    if (!canMove) {
      System.out.println("No puedes moverte hacia arriba");
      this.show();
    }
  }

  public void movePlayerToBottom() {
    PlayerPosition currentPosition = this.player.getPosition();
    PlayerPosition targetPosition = new PlayerPosition(currentPosition.x + 1, currentPosition.y);
    boolean canMove = movePlayer(targetPosition);
    if (!canMove) {
      System.out.println("No puedes moverte hacia abajo");
      this.show();
    }
  }

  public void generateCellMatrix(int length) {
    this.cellMatrix = new LabyrinthCell[length][length];
    PlayerPosition position = this.player.getPosition();
    this.cellMatrix[position.x][position.y] = new LabyrinthCell(LabyrinthCell.TYPE_PLAYER);
    // for (Ceil[] cells : this.cellMatrix) {
    // for (Ceil cell : cells) {
    //
    // System.out.print(cell.getSimbol());
    // }
    // System.out.println();
    // }
    // this.cellMatrix[0][0] = new LabyrinthCell(LabyrinthCell.TYPE_WAY);
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

  public void show() {
    for (LabyrinthCell[] cells : this.cellMatrix) {
      for (LabyrinthCell cell : cells) {
        System.out.print(cell.getSymbol());
      }
      System.out.println();
    }
  }

}
