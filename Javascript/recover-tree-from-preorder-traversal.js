// Definition for a binary tree node
class TreeNode {
    constructor(val, left = null, right = null) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

/**
 * Function to recover the binary tree from preorder traversal
 * @param {string} traversal - Preorder traversal string with depth represented by '-'
 * @return {TreeNode} - Root of the reconstructed binary tree
 */
var recoverFromPreorder = function(traversal) {
    let stack = []; // Stack to keep track of nodes at different depths
    let i = 0;

    while (i < traversal.length) {
        let depth = 0;
        
        // Count the number of dashes to determine the depth of the current node
        while (i < traversal.length && traversal[i] === '-') {
            depth++;
            i++;
        }
        
        // Extract the node value
        let numStart = i;
        while (i < traversal.length && traversal[i] !== '-') {
            i++;
        }
        let val = parseInt(traversal.substring(numStart, i), 10);
        
        // Create a new tree node
        let node = new TreeNode(val);
        
        // If the stack has more elements than depth, pop elements to maintain correct parent-child relationships
        while (stack.length > depth) {
            stack.pop();
        }
        
        // Attach the new node to its parent
        if (stack.length > 0) {
            if (!stack[stack.length - 1].left) {
                stack[stack.length - 1].left = node;
            } else {
                stack[stack.length - 1].right = node;
            }
        }
        
        // Push the new node to the stack
        stack.push(node);
    }
    
    return stack[0]; // The first element in the stack is the root
};

/**
 * Function to print tree in level order for better visualization
 * @param {TreeNode} root - Root node of the tree
 */
var printTree = function(root) {
    if (!root) return;
    
    let queue = [root];
    let result = [];

    while (queue.length > 0) {
        let node = queue.shift();
        result.push(node ? node.val : "null");

        if (node) {
            queue.push(node.left);
            queue.push(node.right);
        }
    }
    
    console.log(result.filter(v => v !== "null")); // Print tree in level order
};

// Example Usage
let traversal = "1-2--3--4-5--6--7";
let root = recoverFromPreorder(traversal);
printTree(root);  // Output: [1, 2, 5, 3, 4, 6, 7]
