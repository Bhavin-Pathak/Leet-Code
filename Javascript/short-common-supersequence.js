function shortestCommonSupersequence(str1, str2) {
    let m = str1.length, n = str2.length;
    // Step 1: Create a DP table to store the length of the Longest Common Subsequence (LCS)
    let dp = Array(m + 1).fill(null).map(() => Array(n + 1).fill(0));
    // Step 2: Fill the DP table using bottom-up approach
    for (let i = 1; i <= m; i++) {
        for (let j = 1; j <= n; j++) {
            if (str1[i - 1] === str2[j - 1]) {
                // If characters match, take diagonal value +1
                dp[i][j] = 1 + dp[i - 1][j - 1];
            } else {
                // Otherwise, take the max of left or top value
                dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
            }
        }
    }
    // Step 3: Construct the Shortest Common Supersequence using the DP table
    let i = m, j = n;
    let result = [];
    
    while (i > 0 && j > 0) {
        if (str1[i - 1] === str2[j - 1]) {
            // If characters match, add it to result and move diagonally
            result.push(str1[i - 1]);
            i--;
            j--;
        } else if (dp[i - 1][j] > dp[i][j - 1]) {
            // If value from top is greater, add character from str1 and move up
            result.push(str1[i - 1]);
            i--;
        } else {
            // If value from left is greater, add character from str2 and move left
            result.push(str2[j - 1]);
            j--;
        }
    }
    // Step 4: Add remaining characters from str1 and str2
    while (i > 0) {
        result.push(str1[i - 1]);
        i--;
    }
    while (j > 0) {
        result.push(str2[j - 1]);
        j--;
    }
    // Step 5: Reverse and return the result as a string
    return result.reverse().join('');
}

// Example usage
console.log(shortestCommonSupersequence("abac", "cab")); // Output: "cabac"
console.log(shortestCommonSupersequence("aaaaaaaa", "aaaaaaaa")); // Output: "aaaaaaaa"
