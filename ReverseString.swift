class Solution {
    func reverseString(_ s: inout [Character]) {
        // Initialize two pointers: one at the start and one at the end of the list
        var left = 0
        var right = s.count - 1
        
        // Swap elements while the left pointer is less than the right pointer
        while left < right {
            // Swap characters at left and right
            s.swapAt(left, right)
            // Move the pointers towards the center
            left += 1
            right -= 1
        }
    }
}

// Explanation:
// Key Observations:
// - The input is given as a list of characters (`s`).
// - To reverse the string, swap the first character with the last, the second with the second-to-last, and so on.
// - Use a two-pointer approach to minimize space usage and perform the reversal in-place.

// Approach:
// 1. Initialize two pointers:
//    - `left` starts at the beginning (index 0).
//    - `right` starts at the end (index s.count - 1).
// 2. Swap characters at `left` and `right` while `left < right`.
// 3. After each swap, increment `left` and decrement `right` to move towards the center.
// 4. The process stops when `left >= right`, meaning all swaps are complete.

// Complexity Analysis:
// Time Complexity: O(n)
// - The algorithm processes each character in the string once, where `n` is the length of the string.
// Space Complexity: O(1)
// - The algorithm uses only two pointers and performs swaps in-place, requiring constant additional space.

// Example usage
let solution = Solution()

var s1: [Character] = ["h", "e", "l", "l", "o"]
solution.reverseString(&s1)
print(s1)  // Output: ["o", "l", "l", "e", "h"]

var s2: [Character] = ["H", "a", "n", "n", "a", "h"]
solution.reverseString(&s2)
print(s2)  // Output: ["h", "a", "n", "n", "a", "H"]

var s3: [Character] = ["a"]
solution.reverseString(&s3)
print(s3)  // Output: ["a"]

var s4: [Character] = ["a", "b"]
solution.reverseString(&s4)
print(s4)  // Output: ["b", "a"]
