package sort.radix;

public record RadixSort () {
  public static int lessSignificantDigit (int number, int digitPos, int radix) {
    if (digitPos <= 0)
      throw new Error("Digit position must be an integer positive");
    return (int) (Math.floor(number / Math.pow(radix , (digitPos - 1))) % 10);
  }
}
