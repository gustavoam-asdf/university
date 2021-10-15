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
    if (this.rowsLength() > length)
      throw new IllegalArgumentException("Length of array flatted must be greater than matrix length");
    int[] array = new int[length];
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

  public int[][] fill (int value) {
    for (int i = 0; i < this.rowsLength(); i++ ) {
      for (int j = 0; j < this.columnsLength(); j++) {
        this.set(i, j, value);
      }
    }
    return this.matrixValues;
  }

  public void print () {
    for (int i = 0; i < this.rowsLength(); i++ ) {
      for (int j = 0; j < this.columnsLength(); j++) {
        System.out.print(this.get(i, j) + ", ");
      }
      System.out.println();
    }
  }

}
