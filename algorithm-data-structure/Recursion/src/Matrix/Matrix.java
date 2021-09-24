package Matrix;

public class Matrix {

  public static void main(String[] args) {
    double[][] matrix1 = {
      {3, 6, -2},
      {-4, 1, -3},
      {5, -5, 2}
    };

    double[][] matrix2 = {
      {2, -3, -4},
      {0, 5, 2},
      {-1, -2, 3}
    };

    System.out.printf("""
      Determinante de la primera matriz: %.2f
      Determinante de la segunda matriz: %.2f
    """, determinantMatrix(matrix1), determinantMatrix(matrix2));

  }

  public static int signMap (int coorX, int coorY) {
    if ((coorX + coorY) % 2 == 0)
      return 1;
    else
      return -1;
  }

  public static double[][] getCofactor (double[][] matrix, int coorX, int coorY) {
    int length = matrix.length;
    double[][] cofactor = new double[length - 1][length - 1];

    int cofactorCoorX = 0, cofactorCoorY = 0;

    for (int i = 0; i < length; i++) {
      for (int j = 0; j < length; j++) {
        if (i == coorX || j == coorY) continue;
        cofactor[cofactorCoorX][cofactorCoorY++] = matrix[i][j];
        if (cofactorCoorY == cofactor.length) {
          cofactorCoorX++;
          cofactorCoorY = 0;
        }
      }
    }

    return cofactor;
  }

  public static double determinantMatrix (double[][] matrix ) {
    int length = matrix.length;
    double determinat = 0;

    if (length == 1) {
      return  matrix[0][0];
    }

    double[] firstLine = matrix[0];
    int coorX = 0;

    for (int coorY = 0; coorY < length; coorY++) {
      double[][] cofactor = getCofactor(matrix, coorX, coorY);
      determinat += signMap(coorX, coorY) * firstLine[coorY] * determinantMatrix(cofactor);
    }

    return determinat;
  }

}
