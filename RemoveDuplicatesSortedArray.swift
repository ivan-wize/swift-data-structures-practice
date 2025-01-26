class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // Edge case: If the array is empty, return 0
        if nums.isEmpty { return 0 }
        
        // Initialize a pointer 'k' to track the position of unique elements
        var k = 1 // Starts at 1 because the first element is always unique
        
        // Loop through the array starting from the second element
        for i in 1..<nums.count {
            // If the current element is different from the previous unique element
            if nums[i] != nums[k - 1] {
                nums[k] = nums[i] // Move the unique element to the 'k' position
                k += 1 // Increment 'k' to point to the next position for a unique element
            }
        }
        
        // Return the count of unique elements
        return k
    }
}

// Explanation:
// Key Observations:
// - The input array is sorted, so duplicates will always be adjacent.
// - Use a pointer `k` to keep track of the position for unique elements.
// - As you iterate, whenever a new unique element is found, move it to the position `k` and increment `k`.

// Approach:
// 1. Edge Case:
//    - If the input array is empty, immediately return 0 (no unique elements).
// 2. Use a Pointer:
//    - Initialize `k = 1` since the first element is always unique.
// 3. Iterate Through the Array:
//    - For each element starting from the second, check if it is different from the previous unique element (`nums[k - 1]`).
//    - If it is, move it to position `k` and increment `k`.
// 4. Return the Result:
//    - `k` represents the count of unique elements in the array.

// Complexity Analysis:
// Time Complexity: O(n)
// - Single pass through the array with `n` elements.
// Space Complexity: O(1)
// - In-place modification; no extra space is used apart from the `k` pointer.

// Example usage
let solution = Solution()

var nums1 = [1, 1, 2]
let k1 = solution.removeDuplicates(&nums1)
print(k1, Array(nums1.prefix(k1))) // Output: 2, [1, 2]

var nums2 = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
let k2 = solution.removeDuplicates(&nums2)
print(k2, Array(nums2.prefix(k2))) // Output: 5, [0, 1, 2, 3, 4]

var nums3: [Int] = []
let k3 = solution.removeDuplicates(&nums3)
print(k3, Array(nums3.prefix(k3))) // Output: 0, []

var nums4 = [1]
let k4 = solution.removeDuplicates(&nums4)
print(k4, Array(nums4.prefix(k4))) // Output: 1, [1]

var nums5 = [1, 1, 1, 1]
let k5 = solution.removeDuplicates(&nums5)
print(k5, Array(nums5.prefix(k5))) // Output: 1, [1]
