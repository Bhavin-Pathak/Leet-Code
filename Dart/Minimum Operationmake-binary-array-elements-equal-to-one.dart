int minOperationsToMakeAllOnes(List<int> nums) {
  int n = nums.length;
  int operations = 0;

  // Iterate through the array up to the third-last element
  for (int i = 0; i <= n - 3; i++) {
    // If the current element is 0, we must flip it along with the next two elements
    if (nums[i] == 0) {
      // Perform bitwise XOR to flip 0 to 1 and 1 to 0
      nums[i] ^= 1;
      nums[i + 1] ^= 1;
      nums[i + 2] ^= 1;
      operations++; // Increment the operation count
    }
  }

  // If there's a remaining 0 in the last two positions, it's impossible to make all 1s
  return (nums[n - 2] == 0 || nums[n - 1] == 0) ? -1 : operations;
}

// Example Usage
void main() {
  print(minOperationsToMakeAllOnes([0, 1, 1, 1, 0, 0])); // Output: 3
  print(minOperationsToMakeAllOnes([0, 1, 1, 1])); // Output: -1
  print(minOperationsToMakeAllOnes([1, 1, 1, 1, 0, 0])); // Output: -1
}
