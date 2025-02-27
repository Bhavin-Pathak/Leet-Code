int lenLongestFibSubseq(List<int> arr) {
  Map<int, int> index = {}; // Store the index of each number in the array
  Map<String, int> dp =
      {}; // DP map to store the length of Fibonacci-like subsequences
  int maxLen = 0; // Variable to keep track of the maximum subsequence length
  int n = arr.length;
  // Store the indices of all numbers in the array
  for (int i = 0; i < n; i++) {
    index[arr[i]] = i;
  }
  // Iterate over pairs (j, i) where j < i
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < i; j++) {
      int x = arr[j], y = arr[i]; // Consider the pair (x, y)
      int length = 2; // Default length for a new sequence
      // Check if x + y exists in the array
      if (index.containsKey(x + y)) {
        int k = index[x + y]!; // Get the index of (x + y)
        String prevKey = "$j,$i"; // Previous key
        // Extend the previous subsequence if it exists, otherwise start with length 2
        length = (dp[prevKey] ?? 2) + 1;
        // Store the new length for the sequence ending at (i, k)
        dp["$i,$k"] = length;
        // Update the maximum length found so far
        maxLen = maxLen > length ? maxLen : length;
      }
    }
  }
  // If the longest subsequence is less than 3, return 0 (no valid sequence)
  return maxLen >= 3 ? maxLen : 0;
}

// Test the function with the given example
void main() {
  print(lenLongestFibSubseq([1, 2, 3, 4, 5, 6, 7, 8])); // Output: 5
}
