String findDifferentBinaryString(List<String> nums) {
  int n =
      nums.length; // Number of binary strings, also the length of each string
  Set<String> numSet = nums.toSet(); // Convert list to a set for quick lookup

  // Iterate through all possible binary numbers from 0 to 2^n - 1
  for (int i = 0; i < (1 << n); i++) {
    // Convert the number to a binary string, ensuring it has `n` length using `padLeft`
    String binaryStr = i.toRadixString(2).padLeft(n, '0');

    // If this binary string is not in the given list, return it as the result
    if (!numSet.contains(binaryStr)) {
      return binaryStr;
    }
  }
  return ""; // This case won't occur as per problem constraints
}

void main() {
  // Test cases
  print(findDifferentBinaryString(["01", "10"])); // Output: "11" or "00"
  print(findDifferentBinaryString(["00", "01"])); // Output: "11" or "10"
  print(
    findDifferentBinaryString(["111", "011", "001"]),
  ); // Output: "101" or another valid binary string
}
