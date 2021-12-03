package sort.radix;

import sort.Main;

public class RadixSort {

  // LSD

  private static int lessSignificantDigit (int number, int exponent, int radix) {
    return ( number / exponent) % radix;
  }

  private static void countingSortByDigit( Integer[] array, int radix, int exponent, int minValue) {
    int index;
    int[] countArray = new int[radix];
    int[] output = new int[array.length];

    for (int i = 0; i < radix; i++) countArray[i] = 0;

    for (int number : array) {
      index = lessSignificantDigit(number - minValue, exponent, radix);
      countArray[index]++;
    }

    for (int i = 1; i < radix; i++) {
      countArray[i] += countArray[i - 1];
    }

    for (int i = array.length - 1; i >= 0; i--) {
      index = lessSignificantDigit(array[i] - minValue, exponent, radix);
      output[--countArray[index]] = array[i];
    }

    for (int i = 0; i < array.length; i++) {
      array[i] = output[i];
    }
  }

  public static void sortLSD(Integer[] array, int radix) {
    if (array.length == 0) {
      return;
    }
    int minValue = array[0];
    int maxValue = array[0];
    for (int i = 1; i < array.length; i++) {
      if (array[i] < minValue) {
        minValue = array[i];
      } else if (array[i] > maxValue) {
        maxValue = array[i];
      }
    }
    int exponent = 1;
    while ((maxValue - minValue) / exponent >= 1) {
      RadixSort.countingSortByDigit(array, radix, exponent, minValue);
      exponent *= radix;
    }
  }

  public static void sortLSD(Integer[] array) {
    RadixSort.sortLSD(array, 10);
  }

  // MSD

  private static int charAt(String str, int digitPosition) {
    if (str.length() <= digitPosition)
      return -1;
    else
      return str.charAt(digitPosition);
  }

  public static void sortMSD(String[] strings, int lower, int higher, int digitPosition) {
    if (higher <= lower) return;
    System.out.println();
    System.out.println("Lower:      " + lower);
    System.out.println("Higher:     " + higher);
    System.out.println("Caracter:   " + digitPosition);

    int index;
    int[] countArray = new int[256 + 1];

    String[] output = new String[strings.length];

    for (int i = lower; i <= higher; i++) {
      index = charAt(strings[i], digitPosition);
      countArray[index]++;
    }

    for (int r = 0; r < 256; r++) {
      countArray[r + 1] += countArray[r];
    }

    for (int i = lower; i <= higher; i++) {
      index = charAt(strings[i], digitPosition);
      output[--countArray[index]] = strings[i];
    }

    System.out.print("Entrada:    ");
    Main.printRow(strings);

    for (int i = lower; i <= higher; i++) {
      strings[i] = output[i - lower];
    }
    System.out.print("Salida:     ");
    Main.printRow(strings);

    for (int r = 0; r < 256; r++) {
      sortMSD(strings, lower + countArray[r], lower + countArray[r + 1] - 1, digitPosition + 1);
    }
  }

  public static void sortMSD(String[] strings) {
    RadixSort.sortMSD(strings, 0, strings.length - 1, 0);
  }

}