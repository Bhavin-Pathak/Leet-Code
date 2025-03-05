int coloredCells(int n) {
  // We use the formula derived from the pattern:
  // Total colored cells = n^2 + (n-1)^2
  return n * n + (n - 1) * (n - 1);
}

void main() {
  // Example test cases
  print(coloredCells(1)); // Output: 1  -> Only the first cell is colored
  print(coloredCells(2)); // Output: 5  -> 4 surrounding cells + 1 center
}
