// Definition for singly-linked list
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    // Iterative Solution
    func reverseListIterative(_ head: ListNode?) -> ListNode? {
        // Initialize previous pointer as nil
        var prev: ListNode? = nil
        // Current pointer starts at the head
        var current = head
        
        // Iterate through the linked list
        while current != nil {
            // Temporarily store the next node
            let nextNode = current?.next
            // Reverse the current node's pointer
            current?.next = prev
            // Move the previous pointer to the current node
            prev = current
            // Move to the next node in the original list
            current = nextNode
        }
        
        // Return the new head of the reversed list
        return prev
    }
    
    // Recursive Solution
    func reverseListRecursive(_ head: ListNode?) -> ListNode? {
        // Base case: If head is nil or has only one node, return head
        if head == nil || head?.next == nil {
            return head
        }
        
        // Reverse the rest of the list recursively
        let reversedHead = reverseListRecursive(head?.next)
        // Adjust the pointers for the current node
        head?.next?.next = head
        head?.next = nil
        
        // Return the new head of the reversed list
        return reversedHead
    }
}

// Explanation:
// Iterative Approach:
// 1. Use two pointers: `prev` (to track the previous node) and `current` (to iterate through the list).
// 2. For each node:
//    - Temporarily store the next node.
//    - Reverse the current node's pointer to point to the previous node.
//    - Move `prev` to the current node and `current` to the next node.
// 3. Once the iteration completes (`current` becomes nil), `prev` will point to the new head of the reversed list.

// Recursive Approach:
// 1. Base Case: If the list is empty or has only one node, return the head.
// 2. Recursive Step:
//    - Reverse the rest of the list (`head.next`).
//    - Adjust the pointers for the current node (`head.next.next = head` and `head.next = nil`).
// 3. Return the new head of the reversed list.

// Complexity Analysis:
// Time Complexity: O(n)
// - Each node is processed exactly once in both iterative and recursive approaches.
// Space Complexity:
// - Iterative: O(1) (no additional space used apart from pointers).
// - Recursive: O(n) (due to the recursive call stack).

// Helper function to create a linked list from an array
func createLinkedList(_ values: [Int]) -> ListNode? {
    guard !values.isEmpty else { return nil }
    let head = ListNode(values[0])
    var current = head
    for value in values.dropFirst() {
        current.next = ListNode(value)
        current = current.next!
    }
    return head
}

// Helper function to convert a linked list to an array
func linkedListToArray(_ head: ListNode?) -> [Int] {
    var result = [Int]()
    var current = head
    while current != nil {
        result.append(current!.val)
        current = current?.next
    }
    return result
}

// Example usage
let solution = Solution()

// Test case 1: [1, 2, 3, 4, 5]
var head = createLinkedList([1, 2, 3, 4, 5])
var reversedHead = solution.reverseListIterative(head)
print(linkedListToArray(reversedHead))  // Output: [5, 4, 3, 2, 1]

// Test case 2: [1, 2]
head = createLinkedList([1, 2])
reversedHead = solution.reverseListRecursive(head)
print(linkedListToArray(reversedHead))  // Output: [2, 1]

// Test case 3: []
head = createLinkedList([])
reversedHead = solution.reverseListIterative(head)
print(linkedListToArray(reversedHead))  // Output: []

// Test case 4: [1]
head = createLinkedList([1])
reversedHead = solution.reverseListRecursive(head)
print(linkedListToArray(reversedHead))  // Output: [1]
