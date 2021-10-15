package sort.radix;

import sort.Main;

public class RadixSort {

  public static final int UNKNOWN_NUMBER = Integer.MIN_VALUE;

//  public RadixSort (int[] numbers, int radix) {
//    int digitPos = 1;
//    int[][] numbersByLSD = assignByLSD(numbers, digitPos, radix);
//    int[] reorderNumbers = numbersByLSD.flat(1)
//    while (!reorderNumbers.every((n: number) => LSD(n, digitPos) === 0)) {
//      numbersByLSD = assignByLSD(reorderNumbers, ++digitPos)
//      reorderNumbers = numbersByLSD.flat(1)
//    }
//    return reorderNumbers
//  }

  public static int lessSignificantDigit (int number, int digitPos, int radix) {
    if (digitPos <= 0)
      throw new Error("Digit position must be an integer positive");
    return (int) (Math.floor(number / Math.pow(radix , (digitPos - 1))) % 10);
  }

  public static IntegerMatrix assignByLSD(int[] numbers, int digitPos, int radix) {
    IntegerMatrix positions = new IntegerMatrix(10, numbers.length);
    int[] counters = {0,0,0,0,0,0,0,0,0,0};
    for (int number : numbers) {
      int LSD = lessSignificantDigit(number, digitPos, radix);
      positions.set(LSD, counters[LSD]++, number);
    }
    return positions;
  }

}
