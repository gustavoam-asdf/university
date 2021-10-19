package sort;

import sort.radix.IntegerMatrix;
import sort.radix.RadixSort;

public class Main {

  public static void main(String[] args) {
    int[] array = {
      32, 24, 555, -12, 0, 45, 3234, 2342, 1231, 9, 0, 5, -1, -2, 7, 33, 46, 74, 79,
      323, 457, 23214, -10, 12356
    };

    int[] reorderNumbers = RadixSort.sort(array, 10);
    IntegerMatrix.printRow(reorderNumbers);
  }
}
