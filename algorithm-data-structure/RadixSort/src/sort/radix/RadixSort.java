package sort.radix;

public class RadixSort {

  public static int[] sort(int[] numbers, int radix) {
    int digitPos = 1;
    int baseToCompare = IntegerMatrix.minValueRow(numbers);
    int[] reorderNumbers = assignByLSD(numbers, digitPos, radix, baseToCompare);
    while (!allLSDAreZero(reorderNumbers, digitPos, radix, baseToCompare)) {
      reorderNumbers = assignByLSD(reorderNumbers, ++digitPos, radix,baseToCompare);
    }
    return reorderNumbers;
  }

  public static int lessSignificantDigit (int number, int digitPos, int radix) {
    if (digitPos <= 0)
      throw new Error("Digit position must be an integer positive");
    return (int) (number / Math.pow(radix , (digitPos - 1)) % radix);
  }

  public static int[] assignByLSD(int[] numbers, int digitPos, int radix, int baseToCompare) {
    IntegerMatrix positions = new IntegerMatrix(radix, numbers.length);
    int[] counters = IntegerMatrix.fillRow(new int[radix], 0);
    for (int number : numbers) {
      int LSD = lessSignificantDigit(number - baseToCompare, digitPos, radix);
      positions.set(LSD, counters[LSD]++, number);
    }
    return positions.flat(numbers.length);
  }

  public static boolean allLSDAreZero (int[] row, int digitPos, int radix, int baseToCompare) {
    boolean areZero = true;
    for (int number : row) {
      if (lessSignificantDigit(number - baseToCompare, digitPos, radix) != 0) {
        areZero = false;
        break;
      }
    }
    return areZero;
  }

}
