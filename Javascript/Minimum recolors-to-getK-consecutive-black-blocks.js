function minRecolors(blocks, k) {
  let minOperations = Infinity; // Initialize to a large value
  let whiteCount = 0; // Tracks number of 'W' in the current window

  // Count the number of 'W' in the first window of size k
  for (let i = 0; i < k; i++) {
    if (blocks[i] === "W") whiteCount++;
  }

  minOperations = whiteCount; // Set initial minimum operations needed

  // Sliding window: move the window one step at a time
  for (let i = k; i < blocks.length; i++) {
    // If the new character entering the window is 'W', increase whiteCount
    if (blocks[i] === "W") whiteCount++;

    // If the character leaving the window (at i - k) is 'W', decrease whiteCount
    if (blocks[i - k] === "W") whiteCount--;

    // Update minOperations with the lowest number of operations found
    minOperations = Math.min(minOperations, whiteCount);
  }

  return minOperations; // Return the minimum number of recolors needed
}

// Example cases
console.log(minRecolors("WBBWWBBWBW", 7)); // Output: 3
console.log(minRecolors("WBWBBBW", 2)); // Output: 0
