/**
 * @param {number[]} nums
 * @param {number[][]} queries
 * @return {number}
 */
var minZeroArray = function (nums, queries) {
  let n = nums.length,
    left = 0,
    right = queries.length;

  // If it's impossible to make nums a zero array after all queries
  if (!canBeZero(nums, queries, right)) return -1;

  // Binary Search for the minimum k
  while (left <= right) {
    let mid = Math.floor(left + (right - left) / 2);
    if (canBeZero(nums, queries, mid)) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }

  return left;
};

/**
 * Helper function to check if nums can be a zero array after `k` queries
 */
function canBeZero(nums, queries, k) {
  let n = nums.length,
    sum = 0;
  let diff = new Array(n + 1).fill(0);

  // Apply first k queries using difference array
  for (let i = 0; i < k; i++) {
    let [l, r, val] = queries[i];
    diff[l] += val;
    diff[r + 1] -= val;
  }

  // Apply difference array and check if nums becomes zero
  for (let i = 0; i < n; i++) {
    sum += diff[i];
    if (sum < nums[i]) return false;
  }

  return true;
}

// Example usage:
console.log(
  minZeroArray(
    [2, 0, 2],
    [
      [0, 2, 1],
      [0, 2, 1],
      [1, 1, 3],
    ]
  )
); // Output: 2
console.log(
  minZeroArray(
    [4, 3, 2, 1],
    [
      [1, 3, 2],
      [0, 2, 1],
    ]
  )
); // Output: -1
