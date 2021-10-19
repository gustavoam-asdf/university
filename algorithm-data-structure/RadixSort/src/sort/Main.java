package sort;

import sort.radix.RadixSort;

import java.util.Arrays;

public class Main {

  public static void main(String[] args) {
    int[] shortArray = {32, 24, 12, -2};

    int[] array = {
      32, 24, 1234555, -12, 245, 3234, 2342, 1231, 9, 123532, 5, -1, -2, 7, 33, 46, 74, 79,
      323, 457, 23214, -10, 12356
    };

    int[] reorderNumbers = RadixSort.run(shortArray, 10);
    System.out.println(Arrays.toString(reorderNumbers));

  }
}
