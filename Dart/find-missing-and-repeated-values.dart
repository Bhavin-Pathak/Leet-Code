List<int> findMissingAndRepeated(List<List<int>> grid) {
  int n = grid.length; // Get the grid size (n x n)
  Set<int> numSet = {}; // Set to track unique numbers
  int repeated = 0,
      missing = 0; // Variables to store the repeated and missing numbers

  // Flatten the 2D grid into a 1D list
  List<int> numbers = grid.expand((row) => row).toList();

  // Iterate through numbers and track occurrences
  for (int num in numbers) {
    if (numSet.contains(num)) {
      repeated = num; // Found the repeated number
    }
    numSet.add(num); // Add number to set
  }

  // Find the missing number in the range [1, n*n]
  for (int i = 1; i <= n * n; i++) {
    if (!numSet.contains(i)) {
      missing = i; // Found the missing number
      break;
    }
  }

  return [repeated, missing]; // Return the result as [repeated, missing]
}

// Example Test Cases:
void main() {
  print(
    findMissingAndRepeated([
      [1, 3],
      [2, 2],
    ]),
  ); // Output: [2, 4]
  print(
    findMissingAndRepeated([
      [9, 1, 7],
      [8, 9, 2],
      [3, 4, 6],
    ]),
  ); // Output: [9, 5]
}
