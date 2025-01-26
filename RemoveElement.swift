class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        // Pointer to track the position of valid (non-val) elements
        var k = 0 // Points to the next position for a non-val element
        
        // Iterate through the array
        for i in 0..<nums.count {
            // If the current element is not equal to val
            if nums[i] != val {
                // Place it at the position tracked by k
                nums[k] = nums[i]
                // Increment k to move to the next position
                k += 1
            }
        }
        
        // Return the count of elements that are not equal to val
        return k
    }
}

// Explanation:
// Key Observations:
// - The goal is to remove all occurrences of `val` from the array while maintaining the relative order of remaining elements.
// - Use a pointer `k` to track the position where the next valid element should be placed.
// - Iterate through the array. For each element not equal to `val`, move it to position `k` and increment `k`.

// Approach:
// 1. Initialize a pointer `k` to track the next position for non-`val` elements.
// 2. Loop through the array with index `i`:
//    - If `nums[i]` is not equal to `val`, copy it to `nums[k]`.
//    - Increment `k` to prepare for the next valid element.
// 3. After the loop, the first `k` elements of `nums` will contain all elements not equal to `val`.
// 4. Return `k` as the count of valid elements.

// Complexity Analysis:
// Time Complexity: O(n)
// - Single pass through the array with `n` elements.
// Space Complexity: O(1)
// - The operation is performed in-place; no additional data structures are used.

// Example usage
let solution = Solution()

var nums1 = [3, 2, 2, 3]
let val1 = 3
let k1 = solution.removeElement(&nums1, val1)
print(k1, Array(nums1.prefix(k1))) // Output: 2, [2, 2]

var nums2 = [0, 1, 2, 2, 3, 0, 4, 2]
let val2 = 2
let k2 = solution.removeElement(&nums2, val2)
print(k2, Array(nums2.prefix(k2))) // Output: 5, [0, 1, 3, 0, 4]

var nums3: [Int] = []
let val3 = 1
let k3 = solution.removeElement(&nums3, val3)
print(k3, Array(nums3.prefix(k3))) // Output: 0, []

var nums4 = [1]
let val4 = 1
let k4 = solution.removeElement(&nums4, val4)
print(k4, Array(nums4.prefix(k4))) // Output: 0, []

var nums5 = [4, 5, 6]
let val5 = 7
let k5 = solution.removeElement(&nums5, val5)
print(k5, Array(nums5.prefix(k5))) // Output: 3, [4, 5, 6]
