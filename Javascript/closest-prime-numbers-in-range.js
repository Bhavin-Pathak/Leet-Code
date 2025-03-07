function generatePrimes(n) {
  let isPrime = new Array(n + 1).fill(true);

  // 0 and 1 are not prime numbers
  isPrime[0] = isPrime[1] = false;

  // Mark non-prime numbers using Sieve of Eratosthenes
  for (let i = 2; i * i <= n; i++) {
    if (isPrime[i]) {
      for (let j = i * i; j <= n; j += i) {
        isPrime[j] = false;
      }
    }
  }
  return isPrime;
}

function closestPrimes(left, right) {
  // Step 1: Generate prime numbers up to 'right'
  let isPrime = generatePrimes(right);

  // Step 2: Initialize variables for finding the closest prime pair
  let prevPrime = -1; // Stores the last found prime
  let minDiff = right - left + 1; // Large initial value
  let result = [-1, -1]; // Default result

  // Step 3: Iterate through the range [left, right] and find primes
  for (let i = left; i <= right; i++) {
    if (isPrime[i]) {
      // If 'i' is a prime number
      if (prevPrime !== -1 && i - prevPrime < minDiff) {
        // Update the closest pair if the gap is smaller
        minDiff = i - prevPrime;
        result = [prevPrime, i];
      }
      prevPrime = i; // Update the last found prime
    }
  }

  // Step 4: Return the closest prime pair or [-1, -1] if no valid pair exists
  return result;
}

// Test case
console.log(closestPrimes(710119, 710189)); // Output: [710119, 710189]
