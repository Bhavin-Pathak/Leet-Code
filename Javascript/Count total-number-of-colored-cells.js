function coloredCells(n) {
  // The number of colored cells follows a mathematical pattern:
  // The first minute starts with 1 cell.
  // Each subsequent minute expands the shape outward symmetrically.
  // The total number of colored cells at minute `n` can be derived as:
  // Total colored cells = n^2 + (n-1)^2
  return n * n + (n - 1) * (n - 1);
}

// Test Cases
console.log(coloredCells(1)); // Output: 1  -> Only the first cell is colored
console.log(coloredCells(2)); // Output: 5  -> 4 surrounding cells + 1 center
