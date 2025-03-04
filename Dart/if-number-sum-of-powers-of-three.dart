bool checkPowersOfThree(int n) {
  // Loop while n is greater than 0
  while (n > 0) {
    // If remainder when divided by 3 is 2, it means it's not possible
    if (n % 3 == 2) {
      return false;
    }
    // Reduce n by dividing by 3 (integer division)
    n ~/= 3;
  }
  // If we reach here, n can be represented as sum of distinct powers of 3
  return true;
}

void main() {
  // Example Test Cases
  print(checkPowersOfThree(12)); // true (3^1 + 3^2)
  print(checkPowersOfThree(91)); // true (3^0 + 3^2 + 3^4)
  print(checkPowersOfThree(21)); // false
}
