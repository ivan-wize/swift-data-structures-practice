class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Dictionary to store numbers as keys and their indices as values
        var numToIndex: [Int: Int] = [:]
        
        // Iterate through the array with indices
        for (index, num) in nums.enumerated() {
            // Calculate the complement
            let complement = target - num
            
            // Check if the complement exists in the dictionary
            if let complementIndex = numToIndex[complement] {
                // If complement is found, return the indices of the complement and the current number
                return [complementIndex, index]
            }
            
            // If complement is not found, store the current number and its index in the dictionary
            numToIndex[num] = index
        }
        
        // Return an empty array if no solution is found (not expected as per the problem constraints)
        return []
    }
}

// Explanation:
// Key Observations:
//     To find two numbers in the array that sum to a given target, we can use a dictionary (hash map) to store the numbers and their indices as we iterate through the array.
//     The complement of the current number (i.e., `target - num`) is the value we need to find in the dictionary to achieve the target sum.

// Approach:
//     1. Initialize a Dictionary:
//         - Use a dictionary to map each number to its index in the array.
//     2. Iterate through the Array:
//         - For each number, calculate its complement (i.e., `target - num`).
//         - Check if the complement exists in the dictionary.
//         - If found, return the indices of the complement and the current number.
//         - Otherwise, add the current number and its index to the dictionary.
//     3. Return Result:
//         - The indices of the two numbers are returned as soon as the complement is found.

// Time Complexity:
//     O(n), where n is the length of the array.
//     - We traverse the array once, and dictionary operations (insert and lookup) are O(1) on average.
// Space Complexity:
//     O(n), where n is the number of elements in the array.
//     - In the worst case, we store all elements in the dictionary.

// Test cases
let solution = Solution()
print(solution.twoSum([2, 7, 11, 15], 9))  // Output: [0, 1]
print(solution.twoSum([3, 2, 4], 6))       // Output: [1, 2]
print(solution.twoSum([3, 3], 6))          // Output: [0, 1]
print(solution.twoSum([1, 5, 3, 8], 11))   // Output: [1, 3]
