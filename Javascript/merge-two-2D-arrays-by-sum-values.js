function mergeArrays(nums1, nums2) {
    let map = new Map(); // Create a map to store id-value pairs

    // Process the first array
    for (let [id, val] of nums1) {
        map.set(id, (map.get(id) || 0) + val); // If id exists, add to its value; otherwise, set it
    }

    // Process the second array
    for (let [id, val] of nums2) {
        map.set(id, (map.get(id) || 0) + val); // Sum values if id exists
    }

    // Convert the map to an array and sort by id
    return [...map].sort((a, b) => a[0] - b[0]);
}

// Example Usage
console.log(mergeArrays([[1,2],[2,3],[4,5]], [[1,4],[3,2],[4,1]]));
// Output: [[1,6],[2,3],[3,2],[4,6]]

console.log(mergeArrays([[2,4],[3,6],[5,5]], [[1,3],[4,3]]));
// Output: [[1,3],[2,4],[3,6],[4,3],[5,5]]
