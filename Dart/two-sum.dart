// Function to find two indices whose values sum up to the target
List<int> twoSum(List<int> nums, int target) {
  // Create a hash map to store the numbers and their indices
  Map<int, int> numMap = {};

  // Iterate through the list
  for (int i = 0; i < nums.length; i++) {
    // Calculate the required number to reach the target
    int complement = target - nums[i];

    // Check if the complement is already in the hash map
    if (numMap.containsKey(complement)) {
      // If found, return the indices
      return [numMap[complement]!, i];
    }

    // Store the current number and its index in the hash map
    numMap[nums[i]] = i;
  }

  // If no solution found, return an empty list (should not happen as per the problem statement)
  return [];
}

// Example usage
void main() {
  print(twoSum([2, 7, 11, 15], 9)); // Output: [0, 1]
  print(twoSum([3, 2, 4], 6)); // Output: [1, 2]
  print(twoSum([3, 3], 6)); // Output: [0, 1]
}
