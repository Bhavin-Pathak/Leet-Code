// Definition for a singly-linked list node
class ListNode {
  constructor(val = 0, next = null) {
    this.val = val;
    this.next = next;
  }
}

// Function to add two numbers represented as linked lists
var addTwoNumbers = function (l1, l2) {
  let dummy = new ListNode(0); // Dummy node to simplify operations
  let current = dummy;
  let carry = 0;

  // Loop until both lists are exhausted
  while (l1 !== null || l2 !== null || carry > 0) {
    let sum = carry;

    if (l1 !== null) {
      sum += l1.val; // Add value from first list
      l1 = l1.next;
    }
    if (l2 !== null) {
      sum += l2.val; // Add value from second list
      l2 = l2.next;
    }

    carry = Math.floor(sum / 10); // Compute carry for next iteration
    current.next = new ListNode(sum % 10); // Create a new node with the sum's unit place
    current = current.next;
  }

  return dummy.next; // Return the sum list (skip the dummy node)
};

// Helper function to print linked list (for debugging)
function printList(node) {
  let output = [];
  while (node !== null) {
    output.push(node.val);
    node = node.next;
  }
  console.log(output.join(" -> "));
}

// Example Usage
let l1 = new ListNode(2, new ListNode(4, new ListNode(3))); // 342
let l2 = new ListNode(5, new ListNode(6, new ListNode(4))); // 465

let result = addTwoNumbers(l1, l2); // Expected Output: 7 -> 0 -> 8 (807)
printList(result);
