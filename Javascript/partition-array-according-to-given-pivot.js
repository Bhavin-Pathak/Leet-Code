function pivotArray(nums, pivot) {
  // Create three separate arrays to store elements
  let less = []; // Stores elements smaller than pivot
  let equal = []; // Stores elements equal to pivot
  let greater = []; // Stores elements greater than pivot

  // Iterate through the input array
  for (let num of nums) {
    if (num < pivot) {
      less.push(num); // Add to 'less' if smaller than pivot
    } else if (num === pivot) {
      equal.push(num); // Add to 'equal' if equal to pivot
    } else {
      greater.push(num); // Add to 'greater' if larger than pivot
    }
  }

  // Concatenate the three arrays in the required order and return
  return [...less, ...equal, ...greater];
}

// Example usage:
console.log(pivotArray([9, 12, 5, 10, 14, 3, 10], 10)); // Output: [9, 5, 3, 10, 10, 12, 14]
console.log(pivotArray([-3, 4, 3, 2], 2)); // Output: [-3, 2, 4, 3]
