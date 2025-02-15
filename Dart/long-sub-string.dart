import 'dart:collection';

/// Finds the length of the longest substring without repeating characters.
int lengthOfLongestSubstring(String s) {
  Set<String> charSet = HashSet(); // HashSet to store unique characters
  int left = 0; // Left pointer for the sliding window
  int maxLength = 0; // Stores the maximum length found

  for (int right = 0; right < s.length; right++) {
    while (charSet.contains(s[right])) {
      charSet.remove(s[left]); // Remove character from left if duplicate found
      left++; // Move left pointer ahead
    }
    charSet.add(s[right]); // Add new character to the set
    maxLength = maxLength > (right - left + 1) ? maxLength : (right - left + 1);
  }

  return maxLength;
}

// Example test cases
void main() {
  print(lengthOfLongestSubstring("abcabcbb")); // Output: 3
  print(lengthOfLongestSubstring("bbbbb")); // Output: 1
  print(lengthOfLongestSubstring("pwwkew")); // Output: 3
}
