var checkPowersOfThree = function (n) {
  // Loop while n is greater than 0
  while (n > 0) {
    // Check the remainder when divided by 3
    // If remainder is 2, it's not possible to represent as distinct powers of 3
    if (n % 3 === 2) {
      return false;
    }
    // Reduce n by performing integer division by 3
    n = Math.floor(n / 3);
  }
  // If we reach here, it means n can be represented as sum of distinct powers of 3
  return true;
};

// Example Test Cases
console.log(checkPowersOfThree(12)); // true (3^1 + 3^2)
console.log(checkPowersOfThree(91)); // true (3^0 + 3^2 + 3^4)
console.log(checkPowersOfThree(21)); // false
