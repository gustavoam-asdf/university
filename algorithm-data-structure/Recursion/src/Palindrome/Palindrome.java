package Palindrome;

public class Palindrome {

  public static void main(String[] args) {
    String word = "DABALEARROZALAZORRAELABAD";
    String result = isPalindrome(word) ? "es" : "no es" ;
    System.out.printf("La palabra %s %s un palíndromo", word, result);
  }

  public static boolean isPalindrome (String word) {
    char[] letters = word.toCharArray();

    if (letters.length <= 1) {
      return true;
    }

    if (letters[0] != letters[letters.length - 1]) {
      return false;
    }

    String nextWord = word.substring(1, word.length() - 1);
    System.out.printf("""
      word:       %s
      nextWord:    %s
    """, word, nextWord);
    System.out.println();
    return isPalindrome(nextWord);
  }

}
