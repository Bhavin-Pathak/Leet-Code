/**
 * Finds the length of the longest substring without repeating characters.
 * @param {string} s - The input string.
 * @return {number} - Length of the longest unique substring.
 */
function lengthOfLongestSubstring(s) {
  let charSet = new Set(); // To store unique characters
  let left = 0; // Left pointer for the sliding window
  let maxLength = 0; // Stores the maximum length found

  for (let right = 0; right < s.length; right++) {
    // If character is already in the set, remove from the left
    while (charSet.has(s[right])) {
      charSet.delete(s[left]);
      left++; // Move the left pointer ahead
    }
    // Add new character to the set
    charSet.add(s[right]);
    // Update maxLength with the window size
    maxLength = Math.max(maxLength, right - left + 1);
  }

  return maxLength;
}

// Example test cases
console.log(lengthOfLongestSubstring("abcabcbb")); // Output: 3
console.log(lengthOfLongestSubstring("bbbbb")); // Output: 1
console.log(lengthOfLongestSubstring("pwwkew")); // Output: 3
