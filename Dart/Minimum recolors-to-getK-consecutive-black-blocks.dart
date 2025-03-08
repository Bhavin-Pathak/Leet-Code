int minRecolors(String blocks, int k) {
  int minOperations =
      blocks.length; // Initialize to maximum possible operations
  int whiteCount = 0; // Tracks number of 'W' in the current window

  // Count the number of 'W' in the first window of size k
  for (int i = 0; i < k; i++) {
    if (blocks[i] == 'W') whiteCount++;
  }

  minOperations = whiteCount; // Store the initial minimum operations needed

  // Sliding window: shift window one step at a time
  for (int i = k; i < blocks.length; i++) {
    // If a new character entering the window is 'W', increase whiteCount
    if (blocks[i] == 'W') whiteCount++;

    // If the character leaving the window (at i - k) is 'W', decrease whiteCount
    if (blocks[i - k] == 'W') whiteCount--;

    // Update minOperations with the minimum found so far
    minOperations = whiteCount < minOperations ? whiteCount : minOperations;
  }

  return minOperations; // Return the minimum number of recolors needed
}

// Example cases
void main() {
  print(minRecolors("WBBWWBBWBW", 7)); // Output: 3
  print(minRecolors("WBWBBBW", 2)); // Output: 0
}
