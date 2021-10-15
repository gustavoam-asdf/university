package sort;

import sort.radix.RadixSort;

public class Main {

  public static void main(String[] args) {
    int[] array = {32, 24, 12, 245};

    System.out.println( RadixSort.lessSignificantDigit(array[0], 1, 10) );
    System.out.println( RadixSort.lessSignificantDigit(array[0], 2, 10) );

  }
}
