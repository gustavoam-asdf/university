package sort.radix;

public class IntegerMatrix {

  public static final int UNKNOWN_NUMBER = Integer.MIN_VALUE;

  private int[][] matrixValues;

  public IntegerMatrix(int rows, int cols) {
    this.matrixValues = new int[rows][cols];
    this.fill(UNKNOWN_NUMBER);
  }

  public IntegerMatrix(int[][] matrixValues) {
    this.matrixValues = matrixValues;
  }


  public int get(int i, int j) {
    return this.matrixValues[i][j];
  }

  public int[] get (int i) {
    return this.matrixValues[i];
  }

  public void set (int i, int j, int value) {
    this.matrixValues[i][j] = value;
  }

  public void set (int i, int[] value) {
    this.matrixValues[i] = value;
  }

  public int rowsLength() {
    return this.matrixValues.length;
  }

  public int columnsLength() {
    return this.matrixValues[0].length;
  }

  public int[] flat(int length) {
    int[] array = new int[length];
    fillRow(array, UNKNOWN_NUMBER);
    for (int i = 0; i < array.length; i++) {
      array[i] = UNKNOWN_NUMBER;
    }
    int counter = 0;
    for (int i = 0; i < this.rowsLength(); i++) {
      for (int j = 0; j < this.columnsLength(); j++) {
        if (this.get(i, j) == UNKNOWN_NUMBER) continue;
        array[counter++] = this.get(i, j);
      }
    }
    return array;
  }

  public static int minValueRow(int[] row) {
    int minValue = row[0];
    for (int i = 1; i < row.length; i++) {
      if (row[i] < minValue) {
        minValue = row[i];
      }
    }
    return minValue;
  }

  public static int[] fillRow(int[] row, int value) {
    for (int i = 0; i < row.length; i++) {
      row[i] = value;
    }
    return row;
  }

  public int[] fillRow(int i, int value) {
    return IntegerMatrix.fillRow(this.get(i), value);
  }

  public int[][] fill (int value) {
    for (int i = 0; i < this.rowsLength(); i++) {
      this.fillRow(i, value);
    }
    return this.matrixValues;
  }

  public void print () {
    System.out.println("[");
    for (int i = 0; i < this.rowsLength(); i++ ) {
      System.out.print("  [");
      for (int j = 0; j < this.columnsLength(); j++) {
        String union = j == this.columnsLength() - 1 ? "" : ", ";
        if (this.get(i, j) == UNKNOWN_NUMBER) {
          System.out.print(j == 0 ? " " + union : union);
          continue;
        }
        System.out.print(this.get(i, j) + union);
      }
      System.out.println("]");
    }
    System.out.println("]");
  }
}
