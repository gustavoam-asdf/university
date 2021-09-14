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
    if (currentPosition.x == Player.positionInitial.x && currentPosition.y == Player.positionInitial.y) {
      this.cellMatrix[currentPosition.x][currentPosition.y].setType(LabyrinthCell.TYPE_START);
    } else {
      this.cellMatrix[currentPosition.x][currentPosition.y].setType(LabyrinthCell.TYPE_WAY);
    }
    targetCell.setType(LabyrinthCell.TYPE_PLAYER);
    this.player.setPosition(targetPosition.x, targetPosition.y);
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
    int[][] typesMatrix = {
      {1, 2, 2, 2, 2, 2, 2, 2, 2, 2},
      {1, 2, 1, 1, 1, 1, 1, 2, 1, 2},
      {1, 2, 2, 1, 2, 2, 1, 1, 1, 2},
      {1, 2, 2, 1, 1, 2, 2, 2, 1, 2},
      {1, 2, 1, 1, 1, 1, 1, 2, 1, 2},
      {1, 2, 2, 2, 2, 2, 1, 2, 1, 2},
      {1, 2, 1, 1, 1, 1, 1, 2, 1, 2},
      {1, 2, 1, 2, 2, 1, 2, 2, 1, 2},
      {1, 1, 1, 2, 1, 1, 2, 1, 1, 1},
      {2, 2, 2, 2, 2, 2, 2, 2, 2, 1}
    };

    for (int i = 0; i < length; i++) {
     for (int j = 0; j < length; j++) {
       this.cellMatrix[i][j] = new LabyrinthCell(typesMatrix[i][j]);
     }
    }

    this.cellMatrix[position.x][position.y] = new LabyrinthCell(LabyrinthCell.TYPE_PLAYER);
    this.cellMatrix[length - 1][length - 1] = new LabyrinthCell(LabyrinthCell.TYPE_END);
  }

  public void show() {
//    ClearScreen.run();
    for (LabyrinthCell[] cells : this.cellMatrix) {
      for (LabyrinthCell cell : cells) {
        if (cell == null) continue;
        System.out.print(cell.getSymbol());
      }
      System.out.println();
    }
  }

}
