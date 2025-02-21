// Definition of the TreeNode class representing a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  // Constructor with default values (-1 for contaminated tree).
  TreeNode([this.val = 0, this.left, this.right]);
}

// FindElements class to recover the tree and support find operations.
class FindElements {
  // Set to store all valid recovered node values for quick lookup.
  Set<int> recoveredValues = <int>{};

  // Constructor: Recovers the tree when an object is instantiated.
  FindElements(TreeNode? root) {
    if (root != null) {
      _recoverTree(root, 0); // Start recovery from root with value 0
    }
  }

  // Recursive function to recover the original tree values.
  void _recoverTree(TreeNode node, int value) {
    node.val = value; // Assign the correct value to the node
    recoveredValues.add(value); // Store the value in the set for quick lookup

    // If left child exists, recover it using formula: 2 * value + 1
    if (node.left != null) {
      _recoverTree(node.left!, 2 * value + 1);
    }

    // If right child exists, recover it using formula: 2 * value + 2
    if (node.right != null) {
      _recoverTree(node.right!, 2 * value + 2);
    }
  }

  // Checks whether the given target exists in the recovered tree.
  bool find(int target) {
    return recoveredValues.contains(target); // O(1) lookup time
  }
}

// Main function to test the implementation.
void main() {
  // Constructing the contaminated tree [-1, null, -1]
  TreeNode root = TreeNode(-1, null, TreeNode(-1));

  // Recovering the tree using FindElements
  FindElements findElements = FindElements(root);

  // Testing the find function
  print(findElements.find(1)); // Output: false (1 does not exist)
  print(findElements.find(2)); // Output: true  (2 exists in the recovered tree)
}
