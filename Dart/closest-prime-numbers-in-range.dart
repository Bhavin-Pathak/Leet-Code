// Function to generate prime numbers using the Sieve of Eratosthenes
List<bool> generatePrimes(int n) {
  // Create a boolean list to mark prime numbers
  List<bool> isPrime = List.filled(n + 1, true);

  // 0 and 1 are not prime numbers
  isPrime[0] = false;
  isPrime[1] = false;

  // Start marking multiples as non-prime
  for (int i = 2; i * i <= n; i++) {
    if (isPrime[i]) {
      // Mark all multiples of i as false (not prime)
      for (int j = i * i; j <= n; j += i) {
        isPrime[j] = false;
      }
    }
  }
  return isPrime;
}

// Function to find the closest prime pair in the given range
List<int> closestPrimes(int left, int right) {
  // Step 1: Generate prime numbers up to 'right' using the Sieve of Eratosthenes
  List<bool> isPrime = generatePrimes(right);

  // Step 2: Initialize variables for finding the closest prime pair
  int prevPrime = -1; // To store the last found prime
  int minDiff = right - left + 1; // Start with a large difference
  List<int> result = [-1, -1]; // Default result if no prime pair is found

  // Step 3: Iterate through the range [left, right] and find prime numbers
  for (int i = left; i <= right; i++) {
    if (isPrime[i]) {
      // If 'i' is a prime number
      if (prevPrime != -1 && (i - prevPrime) < minDiff) {
        // Update the closest pair if the difference is smaller
        minDiff = i - prevPrime;
        result = [prevPrime, i];
      }
      prevPrime = i; // Update the previous prime number
    }
  }

  // Step 4: Return the closest prime pair or [-1, -1] if no valid pair exists
  return result;
}

// Main function to test the implementation
void main() {
  print(closestPrimes(710119, 710189)); // Output: [710119, 710189]
}
