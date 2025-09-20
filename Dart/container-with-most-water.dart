// function to get most water inside ther container
int maxArea(List<int> height) {
  // 2 pointers
  int left = 0;
  int right = height.length - 1;
  int maxWater = 0;

  while (left < right) {
    int width = right - left;
    int h = height[left] < height[right] ? height[left] : height[right];
    int area = width * h;
    if (area > maxWater) maxWater = area;

    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }

  return maxWater;
}

void main() {
  print(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])); // Output: 49
  print(maxArea([1, 1])); // Output: 1
}
