List<int> applyOperations(List<int> nums) {
  int n = nums.length;

  // Step 1: Apply operations as per the given conditions
  for (int i = 0; i < n - 1; i++) {
    // If the current element is equal to the next element and is non-zero
    if (nums[i] == nums[i + 1] && nums[i] != 0) {
      nums[i] *= 2; // Double the current element
      nums[i + 1] = 0; // Set the next element to 0
    }
  }

  // Step 2: Shift all zeros to the end
  List<int> result =
      nums.where((num) => num != 0).toList(); // Collect all non-zero elements
  while (result.length < n) {
    result.add(0); // Append zeros to the end to maintain original length
  }

  return result;
}

void main() {
  print(applyOperations([1, 2, 2, 1, 1, 0])); // Output: [1, 4, 2, 0, 0, 0]
  print(applyOperations([0, 1])); // Output: [1, 0]
  print(applyOperations([2, 2, 4, 4, 8, 8])); // Output: [4, 8, 16, 0, 0, 0]
}
