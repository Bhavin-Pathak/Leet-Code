// funtion to get the most water inside the container
var maxArea = function (height) {
    // Two pointers
    let left = 0;
    let right = height.length - 1;
    let maxWater = 0;
    while (left < right) {
        // Width of the container
        const width = right - left;
        // Height is the smaller of the two lines
        const h = Math.min(height[left], height[right]);
        // Area calculation
        const area = width * h;
        maxWater = Math.max(maxWater, area);

        // Move the pointer pointing to the shorter line
        if (height[left] < height[right]) {
            left++;
        } else {
            right--;
        }
    }
    return maxWater;
};

// Example
console.log(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])); // Output: 49
console.log(maxArea([1, 1]));             // Output: 1