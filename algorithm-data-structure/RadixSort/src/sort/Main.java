package sort;

import sort.radix.RadixSort;

public class Main {

  public static void main(String[] args) {
    Integer[] numbers = {2, 3, 1, 43, 45, -23, 3, -2, -12, 0, 4, 6, 10};

    System.out.println("=================Números antes=================");
    printRow(numbers);

    RadixSort.sortLSD(numbers);

    System.out.println("================Números después================");
    printRow(numbers);

    // Input String
    String[] strings = { "midnight", "badge", "bag", "worker", "banner", "wander" };


    System.out.print("Unsorted array : ");
    printRow(strings);

    RadixSort.sortMSD(strings);

    System.out.print("Sorted array : ");
    printRow(strings);


  }

  public static void printRow(Object[] row) {
    System.out.print("[");
    for (int i = 0; i < row.length; i++) {
      System.out.print(row[i].toString() + (i + 1 == row.length ? "" : ", "));
    }
    System.out.println("]");
  }
}
