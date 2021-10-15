package sort;

import sort.radix.IntegerMatrix;
import sort.radix.RadixSort;

import java.util.Arrays;

public class Main {

  public static void main(String[] args) {
    int[] array = {32, 24, 12, 245};

//    const array = [
//      32, 24, 1234555, 12, 245, 3234, 2342, 1231, 9, 123532, 5, 7, 33, 46, 74, 79,
//      323, 457, 23214, 123455, 12356
//    ]

    IntegerMatrix matrix = RadixSort.assignByLSD(array, 1, 10);

//    print(matrix);

//    System.out.println( RadixSort.lessSignificantDigit(array[0], 1, 10) );
//    System.out.println( RadixSort.lessSignificantDigit(array[0], 2, 10) );

  }
}
