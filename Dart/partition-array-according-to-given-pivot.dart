List<int> pivotArray(List<int> nums, int pivot) {
  // Create three separate lists to store elements
  List<int> less = []; // Stores elements smaller than pivot
  List<int> equal = []; // Stores elements equal to pivot
  List<int> greater = []; // Stores elements greater than pivot

  // Iterate through the input list
  for (int num in nums) {
    if (num < pivot) {
      less.add(num); // Add to 'less' if smaller than pivot
    } else if (num == pivot) {
      equal.add(num); // Add to 'equal' if equal to pivot
    } else {
      greater.add(num); // Add to 'greater' if larger than pivot
    }
  }

  // Concatenate the three lists in the required order and return
  return [...less, ...equal, ...greater];
}

void main() {
  // Example usage:
  print(
    pivotArray([9, 12, 5, 10, 14, 3, 10], 10),
  ); // Output: [9, 5, 3, 10, 10, 12, 14]
  print(pivotArray([-3, 4, 3, 2], 2)); // Output: [-3, 2, 4, 3]
}
