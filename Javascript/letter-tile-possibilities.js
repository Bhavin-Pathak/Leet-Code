var numTilePossibilities = function(tiles) {
    let chars = tiles.split(""); // Convert string to character array
    chars.sort(); // Sorting to handle duplicate letters efficiently
    return backtrack(chars, new Array(chars.length).fill(false));
};

function backtrack(chars, used) {
    let count = 0;

    for (let i = 0; i < chars.length; i++) {
        if (used[i]) continue; // Skip used characters

        // Avoid duplicate permutations by ensuring previous duplicate character is used first
        if (i > 0 && chars[i] === chars[i - 1] && !used[i - 1]) continue;

        used[i] = true; // Mark character as used
        count += 1 + backtrack(chars, used); // Count current sequence and recurse
        used[i] = false; // Backtrack to explore other possibilities
    }

    return count;
}

// Test cases for LeetCode
console.log(numTilePossibilities("AAB"));  // Output: 8
console.log(numTilePossibilities("AAABBC")); // Output: 188
console.log(numTilePossibilities("V"));  // Output: 1
