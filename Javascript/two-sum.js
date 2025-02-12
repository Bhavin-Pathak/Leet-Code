// Function to find two indices whose values sum up to the target
function twoSum(nums, target) {
  // Create a hash map to store the numbers and their indices
  let numMap = new Map();

  // Iterate through the array
  for (let i = 0; i < nums.length; i++) {
    // Calculate the required number to reach the target
    let complement = target - nums[i];

    // Check if the complement is already in the hash map
    if (numMap.has(complement)) {
      // If found, return the indices
      return [numMap.get(complement), i];
    }

    // Store the current number and its index in the hash map
    numMap.set(nums[i], i);
  }

  // If no solution found, return an empty array (should not happen as per the problem statement)
  return [];
}

// Example usage
console.log(twoSum([2, 7, 11, 15], 9)); // Output: [0, 1]
console.log(twoSum([3, 2, 4], 6)); // Output: [1, 2]
console.log(twoSum([3, 3], 6)); // Output: [0, 1]
