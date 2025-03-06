function findMissingAndRepeated(grid) {
  const n = grid.length; // Get the size of the grid (n x n)
  const numSet = new Set(); // Set to track unique numbers
  let repeated, missing; // Variables to store repeated and missing numbers

  // Flatten the 2D grid into a 1D array
  const numbers = grid.flat();

  // Iterate through numbers and track occurrences
  for (let num of numbers) {
    if (numSet.has(num)) {
      repeated = num; // Found the repeated number
    }
    numSet.add(num); // Add number to set
  }

  // Find the missing number in the range [1, n*n]
  for (let i = 1; i <= n * n; i++) {
    if (!numSet.has(i)) {
      missing = i; // Found the missing number
      break;
    }
  }

  return [repeated, missing]; // Return the result as [repeated, missing]
}

// Example Test Cases:
console.log(
  findMissingAndRepeated([
    [1, 3],
    [2, 2],
  ])
); // Output: [2, 4]
console.log(
  findMissingAndRepeated([
    [9, 1, 7],
    [8, 9, 2],
    [3, 4, 6],
  ])
); // Output: [9, 5]
