// Definition for a singly-linked list node.
class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

// Function to add two numbers represented as linked lists
ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  ListNode dummy = ListNode(0); // Dummy node to simplify list operations
  ListNode current = dummy;
  int carry = 0;

  // Loop until both lists are exhausted
  while (l1 != null || l2 != null || carry > 0) {
    int sum = carry;

    if (l1 != null) {
      sum += l1.val; // Add value from the first list
      l1 = l1.next;
    }
    if (l2 != null) {
      sum += l2.val; // Add value from the second list
      l2 = l2.next;
    }

    carry = sum ~/ 10; // Compute carry for the next iteration
    current.next =
        ListNode(sum % 10); // Create a new node with the sum's unit place
    current = current.next!;
  }

  return dummy.next; // Return the sum list (skip the dummy node)
}

// Helper function to print linked list (for debugging)
void printList(ListNode? node) {
  while (node != null) {
    print(node.val);
    node = node.next;
  }
}

// Example Usage
void main() {
  ListNode l1 = ListNode(2, ListNode(4, ListNode(3))); // 342
  ListNode l2 = ListNode(5, ListNode(6, ListNode(4))); // 465

  ListNode? result =
      addTwoNumbers(l1, l2); // Expected Output: 7 -> 0 -> 8 (807)
  printList(result);
}
