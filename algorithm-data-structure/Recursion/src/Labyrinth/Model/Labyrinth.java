package Labyrinth.Model;

import Labyrinth.Lib.ClearScreen;

import java.util.Scanner;

public class Labyrinth {

  public int length;
  private LabyrinthCell[][] cellMatrix;
  public Player player;
  public boolean finished;

  public Labyrinth(int length, Player player) {
    this.length = length;
    this.player = player;
    this.finished = false;
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
    if (targetCell.getType() == LabyrinthCell.TYPE_END) {
      this.finished = true;
    }
    targetCell.setType(LabyrinthCell.TYPE_PLAYER);
    this.player.setPosition(targetPosition.x, targetPosition.y);
    this.show();
    return true;
  }

  private void movePlayerToLeft() {
    PlayerPosition currentPosition = this.player.getPosition();
    PlayerPosition targetPosition = new PlayerPosition(currentPosition.x, currentPosition.y - 1);
    boolean canMove = movePlayer(targetPosition);
    if (!canMove) {
      this.show();
      System.out.println("No puedes moverte hacia la izquierda");
    }
  }

  private void movePlayerToRight() {
    PlayerPosition currentPosition = this.player.getPosition();
    PlayerPosition targetPosition = new PlayerPosition(currentPosition.x, currentPosition.y + 1);
    boolean canMove = movePlayer(targetPosition);
    if (!canMove) {
      this.show();
      System.out.println("No puedes moverte hacia la derecha");
    }
  }

  private void movePlayerToUp() {
    PlayerPosition currentPosition = this.player.getPosition();
    PlayerPosition targetPosition = new PlayerPosition(currentPosition.x - 1, currentPosition.y);
    boolean canMove = movePlayer(targetPosition);
    if (!canMove) {
      this.show();
      System.out.println("No puedes moverte hacia arriba");
    }
  }

  private void movePlayerToBottom() {
    PlayerPosition currentPosition = this.player.getPosition();
    PlayerPosition targetPosition = new PlayerPosition(currentPosition.x + 1, currentPosition.y);
    boolean canMove = movePlayer(targetPosition);
    if (!canMove) {
      this.show();
      System.out.println("No puedes moverte hacia abajo");
    }
  }

  public void move (boolean keepMove, Scanner sc) {
    if (!keepMove) sc.close();

    this.show();
    System.out.print("""
        A donde quiere moverse:
             (W) Arriba
             (A) Izquierda
             (S) Abajo
             (D) Derecha
          (Otro) Salir
        ->""");

    char response = sc.next().toLowerCase().charAt(0);

    switch (response) {
      case 'w' -> this.movePlayerToUp();
      case 'a' -> this.movePlayerToLeft();
      case 's' -> this.movePlayerToBottom();
      case 'd' -> this.movePlayerToRight();
      default -> keepMove = false;
    }

    if (this.finished) {
      System.out.println("""
          Felicidades!!!, has completado el laberinto!!!
          """);
      keepMove = false;
    }

    this.move(keepMove, sc);
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
    ClearScreen.run();
    for (LabyrinthCell[] cells : this.cellMatrix) {
      for (LabyrinthCell cell : cells) {
        if (cell == null) continue;
        System.out.print(cell.getSymbol());
      }
      System.out.println();
    }
  }

}
