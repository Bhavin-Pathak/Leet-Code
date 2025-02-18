class Solution {
  int numTilePossibilities(String tiles) {
    List<String> chars = tiles.split(""); // Convert string to character list
    chars.sort(); // Sort to handle duplicate letters efficiently
    return _backtrack(chars, List.filled(chars.length, false));
  }

  int _backtrack(List<String> chars, List<bool> used) {
    int count = 0;

    for (int i = 0; i < chars.length; i++) {
      if (used[i]) continue; // Skip already used characters

      // Skip duplicate characters if the previous identical character was not used in this recursion
      if (i > 0 && chars[i] == chars[i - 1] && !used[i - 1]) continue;

      used[i] = true; // Mark character as used
      count += 1 + _backtrack(chars, used); // Add current sequence and recurse
      used[i] = false; // Backtrack to explore other possibilities
    }

    return count;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.numTilePossibilities("AAB")); // Output: 8
  print(sol.numTilePossibilities("AAABBC")); // Output: 188
  print(sol.numTilePossibilities("V")); // Output: 1
}
