// Definition for singly-linked list
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // Create a dummy node as the starting point of the merged list
        let dummy = ListNode(-1)
        
        // Use a pointer 'current' to build the merged list
        var current = dummy
        var list1 = list1
        var list2 = list2
        
        // Iterate through both lists until one is exhausted
        while let l1 = list1, let l2 = list2 {
            // Compare the values of the current nodes
            if l1.val <= l2.val {
                // Append the smaller node from list1 to the merged list
                current.next = l1
                list1 = l1.next // Move to the next node in list1
            } else {
                // Append the smaller node from list2 to the merged list
                current.next = l2
                list2 = l2.next // Move to the next node in list2
            }
            // Move the 'current' pointer forward in the merged list
            current = current.next!
        }
        
        // Append any remaining nodes from either list
        current.next = list1 ?? list2
        
        // Return the merged list starting from the first node (skip dummy)
        return dummy.next
    }
}

// Explanation:
// Key Observations:
//     - Both input linked lists are sorted, so we can merge them in sorted order using a two-pointer approach.
//     - A dummy node simplifies list manipulation, acting as a placeholder for the start of the merged list.
//     - We iterate through the lists, comparing nodes and appending the smaller one to the merged list.
//     - After one list is exhausted, the remaining nodes of the other list are appended directly (they are already sorted).

// Approach:
//     1. Initialize a dummy node to act as the starting point for the merged list.
//     2. Use a `current` pointer to track the end of the merged list.
//     3. Compare nodes from `list1` and `list2`:
//         - Append the smaller node to the merged list.
//         - Move the pointer (`list1` or `list2`) forward.
//         - Move the `current` pointer forward in the merged list.
//     4. If one list is exhausted, append the remaining nodes of the other list directly.
//     5. Return the merged list starting from `dummy.next`.

// Complexity Analysis:
// Time Complexity: O(n + m)
//     - `n` is the length of `list1`.
//     - `m` is the length of `list2`.
//     - Each node in both lists is processed exactly once, resulting in O(n + m) time complexity.
// Space Complexity: O(1)
//     - The merge is performed in-place, so no additional data structures are used—only pointers are manipulated.

// Helper function to build a linked list from an array
func buildList(_ values: [Int]) -> ListNode? {
    guard !values.isEmpty else { return nil }
    let head = ListNode(values[0])
    var current = head
    for value in values.dropFirst() {
        current.next = ListNode(value)
        current = current.next!
    }
    return head
}

// Helper function to print a linked list
func printList(_ head: ListNode?) {
    var values: [Int] = []
    var current = head
    while let node = current {
        values.append(node.val)
        current = node.next
    }
    print(values)
}

// Example usage
let solution = Solution()
let list1 = buildList([1, 2, 4])
let list2 = buildList([1, 3, 4])

let mergedList = solution.mergeTwoLists(list1, list2)
printList(mergedList)  // Output: [1, 1, 2, 3, 4, 4]

printList(solution.mergeTwoLists(buildList([]), buildList([])))      // Output: []
printList(solution.mergeTwoLists(buildList([]), buildList([0])))     // Output: [0]
printList(solution.mergeTwoLists(buildList([1]), buildList([2])))    // Output: [1, 2]
