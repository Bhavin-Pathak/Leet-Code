// Definition of a TreeNode class representing a binary tree node
class TreeNode {
  constructor(val = 0, left = null, right = null) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}

// FindElements class to recover the tree and support find operations
class FindElements {
  constructor(root) {
    this.recoveredValues = new Set(); // Set to store valid recovered values
    if (root) {
      this.recoverTree(root, 0); // Start recovery with root value = 0
    }
  }

  // Recursive function to recover the original tree values
  recoverTree(node, value) {
    node.val = value; // Assign the correct value to the node
    this.recoveredValues.add(value); // Store the value in the Set

    // If left child exists, recover it using formula: 2 * value + 1
    if (node.left) {
      this.recoverTree(node.left, 2 * value + 1);
    }

    // If right child exists, recover it using formula: 2 * value + 2
    if (node.right) {
      this.recoverTree(node.right, 2 * value + 2);
    }
  }

  // Checks whether the given target exists in the recovered tree
  find(target) {
    return this.recoveredValues.has(target); // O(1) lookup time
  }
}

// Main function to test the implementation
function main() {
  // Constructing the contaminated tree [-1, null, -1]
  let root = new TreeNode(-1, null, new TreeNode(-1));

  // Recovering the tree using FindElements
  let findElements = new FindElements(root);

  // Testing the find function
  console.log(findElements.find(1)); // Output: false (1 does not exist)
  console.log(findElements.find(2)); // Output: true  (2 exists in the recovered tree)
}

// Run the test
main();
