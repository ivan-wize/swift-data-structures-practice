class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // Initialize pointers for nums1 and nums2 from the end
        var p1 = m - 1 // Points to the last initialized element in nums1
        var p2 = n - 1 // Points to the last element in nums2
        var p = m + n - 1 // Points to the last position in nums1
        
        // Compare elements from the back and place the larger one at the current position
        while p1 >= 0 && p2 >= 0 {
            if nums1[p1] > nums2[p2] {
                nums1[p] = nums1[p1]
                p1 -= 1
            } else {
                nums1[p] = nums2[p2]
                p2 -= 1
            }
            p -= 1
        }
        
        // If there are remaining elements in nums2, copy them to nums1
        while p2 >= 0 {
            nums1[p] = nums2[p2]
            p2 -= 1
            p -= 1
        }
        
        // No need to handle remaining elements in nums1 because they are already in place
    }
}

// Explanation:
// Key Observations:
//     - Both arrays are sorted, so we can use a two-pointer approach starting from the back to merge them in-place efficiently.
//     - This avoids overwriting elements in nums1 during the merge process.

// Approach:
//     1. Pointers Initialization:
//         - `p1`: Points to the last initialized element in nums1 (index `m - 1`).
//         - `p2`: Points to the last element in nums2 (index `n - 1`).
//         - `p`: Points to the last position in nums1 (index `m + n - 1`).
//     2. Compare and Place:
//         - Compare `nums1[p1]` and `nums2[p2]`.
//         - Place the larger element at `nums1[p]`.
//         - Move the corresponding pointer (`p1` or `p2`) and decrement `p`.
//     3. Handle Remaining Elements:
//         - If there are leftover elements in nums2, copy them into nums1.
//         - No need to handle leftover elements in nums1 because they are already in the correct position.

// Complexity Analysis:
// Time Complexity: O(m + n)
//     - Each element from nums1 and nums2 is processed once.
// Space Complexity: O(1)
//     - The merge is performed in-place, requiring no extra space.

// Example usage
let solution = Solution()

// Test case 1
var nums1 = [1, 2, 3, 0, 0, 0]
let m = 3
let nums2 = [2, 5, 6]
let n = 3
solution.merge(&nums1, m, nums2, n)
print(nums1)  // Output: [1, 2, 2, 3, 5, 6]

// Test case 2
var nums1_2 = [1]
let m2 = 1
let nums2_2: [Int] = []
let n2 = 0
solution.merge(&nums1_2, m2, nums2_2, n2)
print(nums1_2)  // Output: [1]

// Test case 3
var nums1_3 = [0]
let m3 = 0
let nums2_3 = [1]
let n3 = 1
solution.merge(&nums1_3, m3, nums2_3, n3)
print(nums1_3)  // Output: [1]
