function findDifferentBinaryString(nums) {
    let n = nums.length; // Get the number of binary strings
    let numSet = new Set(nums); // Convert array to Set for quick lookup

    // Loop through all possible binary numbers from 0 to 2^n - 1
    for (let i = 0; i < (1 << n); i++) {
        // Convert `i` to a binary string and pad with leading zeros to ensure it has length `n`
        let binaryStr = i.toString(2).padStart(n, '0');

        // If the generated binary string is not in the given list, return it
        if (!numSet.has(binaryStr)) {
            return binaryStr;
        }
    }

    return ""; // This case will never be reached due to problem constraints
}

// Test cases
console.log(findDifferentBinaryString(["01", "10"])); // Output: "11" or "00"
console.log(findDifferentBinaryString(["00", "01"])); // Output: "11" or "10"
console.log(findDifferentBinaryString(["111", "011", "001"])); // Output: "101" or another valid binary string
