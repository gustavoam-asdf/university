package radixSort;

public class RadixSort {

  public static void sortLSD(Integer[] array) {
    RadixSort.sortLSD(array, 10);
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
}
