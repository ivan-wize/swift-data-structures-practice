class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        // Initialize the maximum sum as the first element
        var maxSum = nums[0]
        // Initialize the current sum as the first element
        var currentSum = nums[0]
        
        // Iterate through the array starting from the second element
        for i in 1..<nums.count {
            // Update the current sum by either adding the current number to the
            // previous sum or starting fresh with the current number
            currentSum = max(nums[i], currentSum + nums[i])
            
            // Update the maximum sum if the current sum is larger
            maxSum = max(maxSum, currentSum)
        }
        
        return maxSum
    }
}

// Explanation:
// Key Observations:
//     - A subarray is a contiguous portion of an array.
//     - To maximize the sum of a subarray, we use Kadane's Algorithm:
//         - Maintain a running sum (`currentSum`).
//         - At each step, decide whether to include the current element in the existing subarray or start a new subarray from the current element.
//         - Update the maximum sum (`maxSum`) whenever `currentSum` exceeds it.

// Approach:
//     1. Initialize `maxSum` and `currentSum` as the first element of the array.
//     2. Iterate through the array starting from the second element:
//         - Update `currentSum` by taking the maximum of the current element or the current element added to `currentSum`.
//         - Update `maxSum` with the maximum of `maxSum` or `currentSum`.
//     3. Return `maxSum` after processing the entire array.

// Complexity Analysis:
// Time Complexity: O(n)
//     - We iterate through the array once, where n is the length of the array.
// Space Complexity: O(1)
//     - We use only two variables (`maxSum` and `currentSum`) for tracking the maximum and current sums.

// Example usage
let solution = Solution()
print(solution.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))  // Output: 6
print(solution.maxSubArray([1]))                              // Output: 1
print(solution.maxSubArray([5, 4, -1, 7, 8]))                 // Output: 23
print(solution.maxSubArray([-1]))                             // Output: -1
print(solution.maxSubArray([-2, -3, -1, -5]))                 // Output: -1
