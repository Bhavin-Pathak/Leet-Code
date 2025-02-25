var numOfSubarrays = function(arr) {
    const MOD = 1e9 + 7; // Define the modulo constant
    let oddCount = 0, evenCount = 1, sum = 0, result = 0;

    // Iterate through the array
    for (let num of arr) {
        sum += num; // Add current number to the cumulative sum
        
        if (sum % 2 === 0) {
            // If sum is even, the number of odd subarrays is increased by the previous oddCount
            result = (result + oddCount) % MOD;
            evenCount++; // Increment even count
        } else {
            // If sum is odd, the number of odd subarrays is increased by the previous evenCount
            result = (result + evenCount) % MOD;
            oddCount++; // Increment odd count
        }
    }

    return result; // Return the total number of subarrays with an odd sum
};

// Test cases
console.log(numOfSubarrays([1, 3, 5])); // Output: 4
console.log(numOfSubarrays([2, 4, 6])); // Output: 0
console.log(numOfSubarrays([1, 2, 3, 4, 5, 6, 7])); // Output: 16
