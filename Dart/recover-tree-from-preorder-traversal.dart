import 'dart:collection';

// Definition for a binary tree node
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val, {this.left, this.right});
}

TreeNode? recoverFromPreorder(String traversal) {
  List<TreeNode?> stack =
      []; // Stack to keep track of nodes at different depths
  int i = 0;

  while (i < traversal.length) {
    int depth = 0;

    // Count the number of dashes to determine the depth of the current node
    while (i < traversal.length && traversal[i] == '-') {
      depth++;
      i++;
    }

    // Extract the node value
    int numStart = i;
    while (i < traversal.length && traversal[i] != '-') {
      i++;
    }
    int val = int.parse(traversal.substring(numStart, i));

    // Create a new tree node
    TreeNode node = TreeNode(val);

    // If the stack has more elements than depth, remove elements to maintain correct parent-child relationships
    while (stack.length > depth) {
      stack.removeLast();
    }

    // Attach the new node to its parent
    if (stack.isNotEmpty) {
      if (stack.last!.left == null) {
        stack.last!.left = node;
      } else {
        stack.last!.right = node;
      }
    }

    // Push the new node to the stack
    stack.add(node);
  }

  return stack.isNotEmpty
      ? stack[0]
      : null; // The first element in the stack is the root
}

void printTree(TreeNode? root) {
  if (root == null) return;

  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  List<int> result = [];

  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst();
    if (node != null) {
      result.add(node.val);
      queue.add(node.left);
      queue.add(node.right);
    }
  }

  print(result); // Print tree in level order
}

// Example Usage
void main() {
  String traversal = "1-2--3--4-5--6--7";
  TreeNode? root = recoverFromPreorder(traversal);
  printTree(root); // Output: [1, 2, 5, 3, 4, 6, 7]
}
