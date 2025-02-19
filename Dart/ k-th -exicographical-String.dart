String getHappyString(int n, int k) {
  List<String> result = []; // To store all happy strings
  List<String> letters = ['a', 'b', 'c']; // The set of allowed characters

  // Helper function to generate happy strings using backtracking
  void backtrack(String current) {
    // If the current string has reached the desired length, add it to the result
    if (current.length == n) {
      result.add(current);
      return;
    }

    // Iterate through all possible characters
    for (String char in letters) {
      // Only add a character if it does not repeat the last character
      if (current.isEmpty || current[current.length - 1] != char) {
        backtrack(current + char); // Recursively build the string
      }
    }
  }

  // Start the backtracking with an empty string
  backtrack("");

  // Return the k-th string (1-indexed) if it exists, otherwise return an empty string
  return k <= result.length ? result[k - 1] : "";
}

// Example Usage
void main() {
  print(getHappyString(1, 3)); // Output: "c"
  print(getHappyString(1, 4)); // Output: ""
  print(getHappyString(3, 9)); // Output: "cab"
}
