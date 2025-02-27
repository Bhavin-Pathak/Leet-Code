var lenLongestFibSubseq = function(arr) {
    let index = new Map(); // Store the index of each number in the array for quick lookup
    let n = arr.length; // Length of the array
    let dp = new Map(); // DP map to store the length of Fibonacci-like subsequences
    let maxLen = 0; // Variable to keep track of the maximum subsequence length
    // Store the indices of all numbers in the array
    for (let i = 0; i < n; i++) {
        index.set(arr[i], i);
    }
    // Iterate over pairs (j, i) where j < i
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < i; j++) {
            let x = arr[j], y = arr[i]; // Consider the pair (x, y)
            let length = 2; // Default length for a new sequence
            // Check if x + y exists in the array
            if (index.has(x + y)) {
                let k = index.get(x + y); // Get the index of (x + y)
                let key = `${j},${i}`; // Key for current subsequence
                let prevKey = `${j},${i}`; // Previous key
                // Extend the previous subsequence if it exists, otherwise start with length 2
                length = (dp.get(prevKey) || 2) + 1;
                // Store the new length for the sequence ending at (i, k)
                dp.set(`${i},${k}`, length);
                // Update the maximum length found so far
                maxLen = Math.max(maxLen, length);
            }
        }
    }
    // If the longest subsequence is less than 3, return 0 (no valid sequence)
    return maxLen >= 3 ? maxLen : 0;
};

// Test cases with example inputs
console.log(lenLongestFibSubseq([1, 2, 3, 4, 5, 6, 7, 8])); // Output: 5
