// Function to check if a number is a palindrome
var isPalindrome = function (x) {
    // Check if the number is negative or ends with a zero (except for zero itself)
    if (x < 0) return false;
    // if the number is divisible by 10, it cannot be a palindrome
    if (x % 10 === 0 && x !== 0) return false;

    // Initialize variables for the original number and its reverse
    let reversedHalf = 0;
    let num = x;
    // while loop to reverse the digits of the number
    while (num > reversedHalf) {
        reversedHalf = reversedHalf * 10 + (num % 10);
        num = Math.floor(num / 10);
    }
    // return the result of comparing the original number with its reverse
    return num === reversedHalf || num === Math.floor(reversedHalf / 10);
};

console.log(isPalindrome(12345)); // Output: false
console.log(isPalindrome(121)); // Output: true
console.log(isPalindrome(1221)); // Output: true