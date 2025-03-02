List<List<int>> mergeArrays(List<List<int>> nums1, List<List<int>> nums2) {
  Map<int, int> map = {}; // Create a map to store ID and their summed values

  // Iterate through the first list and store values in the map
  for (var pair in nums1) {
    int id = pair[0];
    int value = pair[1];
    map[id] = (map[id] ?? 0) + value; // Add value if exists, else set new
  }

  // Iterate through the second list and add values to the map
  for (var pair in nums2) {
    int id = pair[0];
    int value = pair[1];
    map[id] = (map[id] ?? 0) + value; // Add value if exists, else set new
  }

  // Convert map entries to a list of lists
  List<List<int>> result = map.entries.map((e) => [e.key, e.value]).toList();

  // Sort the result based on the id in ascending order
  result.sort((a, b) => a[0].compareTo(b[0]));

  return result;
}

// Example Usage
void main() {
  print(
    mergeArrays(
      [
        [1, 2],
        [2, 3],
        [4, 5]
      ],
      [
        [1, 4],
        [3, 2],
        [4, 1]
      ],
    ),
  );
  // Output: [[1,6],[2,3],[3,2],[4,6]]

  print(
    mergeArrays(
      [
        [2, 4],
        [3, 6],
        [5, 5]
      ],
      [
        [1, 3],
        [4, 3]
      ],
    ),
  );
  // Output: [[1,3],[2,4],[3,6],[4,3],[5,5]]
}
