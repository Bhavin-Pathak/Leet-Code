int minZeroArray(List<int> nums, List<List<int>> queries) {
  int left = 0, right = queries.length;

  // If nums can't be zero even after all queries
  if (!canBeZero(nums, queries, right)) return -1;

  // Binary Search for the minimum k
  while (left <= right) {
    int mid = left + ((right - left) ~/ 2);
    if (canBeZero(nums, queries, mid)) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }

  return left;
}

// Helper function to check if nums can be a zero array after `k` queries
bool canBeZero(List<int> nums, List<List<int>> queries, int k) {
  int n = nums.length, sum = 0;
  List<int> diff = List.filled(n + 1, 0);

  // Apply first k queries using difference array
  for (int i = 0; i < k; i++) {
    int l = queries[i][0], r = queries[i][1], val = queries[i][2];
    diff[l] += val;
    if (r + 1 < diff.length) diff[r + 1] -= val;
  }

  // Apply difference array and check if nums becomes zero
  for (int i = 0; i < n; i++) {
    sum += diff[i];
    if (sum < nums[i]) return false;
  }

  return true;
}

void main() {
  print(
    minZeroArray(
      [2, 0, 2],
      [
        [0, 2, 1],
        [0, 2, 1],
        [1, 1, 3],
      ],
    ),
  ); // Output: 2
  print(
    minZeroArray(
      [4, 3, 2, 1],
      [
        [1, 3, 2],
        [0, 2, 1],
      ],
    ),
  ); // Output: -1
}
