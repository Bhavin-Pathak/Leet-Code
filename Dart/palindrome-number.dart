class Solution {
  bool isPalindrome(int x) {
    // Negative numbers are not palindrome
    if (x < 0) return false;
    // Numbers ending with 0 (but not 0 itself) are not palindrome
    if (x % 10 == 0 && x != 0) return false;
    // Reverse the second half of the number
    int reversedHalf = 0;
    int num = x;
    // while the number is greater than the reversed half
    while (num > reversedHalf) {
      reversedHalf = reversedHalf * 10 + num % 10;
      num ~/= 10; // integer division
    }
    // Compare the first half and the reversed second half
    return num == reversedHalf || num == reversedHalf ~/ 10;
  }
}

void main() {
  var sol = Solution();
  print(sol.isPalindrome(121)); // true
  print(sol.isPalindrome(-121)); // false
  print(sol.isPalindrome(10)); // false
}
