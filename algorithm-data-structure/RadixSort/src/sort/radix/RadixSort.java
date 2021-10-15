package sort.radix;

public class RadixSort {

  public static int[] run (int[] numbers, int radix) {
    int digitPos = 1;
    int[] reorderNumbers = assignByLSD(numbers, digitPos, radix);
    while (!allLSDAreZero(reorderNumbers, digitPos, radix)) {
      reorderNumbers = assignByLSD(reorderNumbers, ++digitPos, radix);
    }
    return reorderNumbers;
  }

  public static int lessSignificantDigit (int number, int digitPos, int radix) {
    if (digitPos <= 0)
      throw new Error("Digit position must be an integer positive");
    return (int) (Math.floor(number / Math.pow(radix , (digitPos - 1))) % 10);
  }

  public static int[] assignByLSD(int[] numbers, int digitPos, int radix) {
    IntegerMatrix positions = new IntegerMatrix(10, numbers.length);
    int[] counters = {0,0,0,0,0,0,0,0,0,0};
    for (int number : numbers) {
      int LSD = lessSignificantDigit(number, digitPos, radix);
      positions.set(LSD, counters[LSD]++, number);
    }
    positions.print();
    return positions.flat(numbers.length);
  }

  public static boolean allLSDAreZero (int[] row, int digitPos, int radix) {
    boolean areZero = true;

    for (int number : row) {
      if (lessSignificantDigit(number, digitPos, radix) != 0) {
        areZero = false;
        break;
      }
    }

    return areZero;
  }

}
