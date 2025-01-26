class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        // Pointer to track the position of the next non-zero element
        var nonZeroIndex = 0
        
        // Iterate through the array
        for i in 0..<nums.count {
            // If the current element is non-zero, swap it with the element at nonZeroIndex
            if nums[i] != 0 {
                nums.swapAt(nonZeroIndex, i) // Swap non-zero element to the correct position
                nonZeroIndex += 1 // Move the nonZeroIndex pointer forward
            }
        }
    }
}

// Explanation:
// Key Observations:
//     - The goal is to move all zeros to the end of the array while maintaining the relative order of non-zero elements.
//     - Use a two-pointer approach to achieve this in a single pass.
//     - By tracking the position of non-zero elements, the array can be updated in place without extra space.

// Approach:
//     1. Use a pointer (`nonZeroIndex`) to track where the next non-zero element should be placed.
//     2. Iterate through the array with an index `i`:
//         - If `nums[i]` is non-zero, swap it with the element at `nonZeroIndex`.
//         - Increment `nonZeroIndex` after placing a non-zero element.
//     3. This ensures all non-zero elements are moved to the start of the array, maintaining their relative order, while zeros are pushed to the end.

// Complexity Analysis:
// Time Complexity: O(n)
//     - We iterate through the array once, where n is the length of the array.
// Space Complexity: O(1)
//     - The operation is performed in-place, requiring no additional space.

// Example usage
let solution = Solution()
var nums1 = [0, 1, 0, 3, 12]
solution.moveZeroes(&nums1)
print(nums1)  // Output: [1, 3, 12, 0, 0]

var nums2 = [0]
solution.moveZeroes(&nums2)
print(nums2)  // Output: [0]

var nums3 = [1, 2, 3, 4]
solution.moveZeroes(&nums3)
print(nums3)  // Output: [1, 2, 3, 4]

var nums4 = [0, 0, 0]
solution.moveZeroes(&nums4)
print(nums4)  // Output: [0, 0, 0]

var nums5 = [2, 0, 5, 0, 3]
solution.moveZeroes(&nums5)
print(nums5)  // Output: [2, 5, 3, 0, 0]
