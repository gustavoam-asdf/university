import radixSort.RadixSort;

public class Main {

  public static void main(String[] args) {
    Integer[] numbers = {2, 3, 1, 43, 45, -23, 3, -2, -12, 0, 4, 6, 10};

    System.out.println("=================Números antes=================");
    printRow(numbers);

    RadixSort.sortLSD(numbers);

    System.out.println("================Números después================");
    printRow(numbers);



  }

  public static void printRow(Object[] row) {
    System.out.print("[");
    for (int i = 0; i < row.length; i++) {
      System.out.print(row[i].toString() + (i + 1 == row.length ? "" : ", "));
    }
    System.out.println("]");
  }
}
