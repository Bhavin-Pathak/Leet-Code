function applyOperations(nums) {
    let n = nums.length;

    // Step 1: Apply the operations as per the given conditions
    for (let i = 0; i < n - 1; i++) {
        // If current element is equal to the next element and is non-zero
        if (nums[i] === nums[i + 1] && nums[i] !== 0) {
            nums[i] *= 2;  // Double the current element
            nums[i + 1] = 0; // Set the next element to 0
        }
    }

    // Step 2: Shift all zeros to the end
    let result = nums.filter(num => num !== 0); // Collect all non-zero elements
    while (result.length < n) {
        result.push(0); // Append zeros to the end to maintain original length
    }

    return result;
}

// Example Usage
console.log(applyOperations([1, 2, 2, 1, 1, 0])); // Output: [1, 4, 2, 0, 0, 0]
console.log(applyOperations([0, 1])); // Output: [1, 0]
console.log(applyOperations([2, 2, 4, 4, 8, 8])); // Output: [4, 8, 16, 0, 0, 0]
