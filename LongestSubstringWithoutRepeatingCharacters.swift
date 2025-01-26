class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // Use a Set to keep track of unique characters in the current substring
        var charSet: Set<Character> = []
        // Initialize two pointers and the maximum length
        var left = 0
        var maxLength = 0
        let chars = Array(s)  // Convert string to array for index-based access
        
        // Iterate through the string with the right pointer
        for right in 0..<chars.count {
            // If the character is already in the set, shrink the window from the left
            while charSet.contains(chars[right]) {
                charSet.remove(chars[left])
                left += 1
            }
            
            // Add the current character to the set
            charSet.insert(chars[right])
            // Update the maximum length
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}

// Explanation:
// Key Observations:
//     - A substring is a contiguous sequence of characters within the string.
//     - To find the longest substring without repeating characters, ensure all characters in the current substring are unique.
//     - Use the sliding window approach with two pointers:
//         - The right pointer expands the window by adding characters.
//         - The left pointer shrinks the window to remove duplicates if necessary.
//     - The set keeps track of characters in the current window for quick lookup and removal.

// Approach:
//     1. Initialize a Set (`charSet`) to track unique characters in the current substring.
//     2. Use two pointers (`left` and `right`) to represent the sliding window:
//         - Move the right pointer to expand the window.
//         - If a duplicate character is found, move the left pointer to shrink the window until the duplicate is removed.
//     3. Update the maximum substring length during each iteration by calculating `right - left + 1`.
//     4. Return the maximum length after iterating through the string.

// Complexity Analysis:
// Time Complexity: O(n)
//     - Each character is added to and removed from `charSet` at most once, where `n` is the length of the string.
// Space Complexity: O(min(n, a))
//     - The space required for `charSet` depends on the size of the input string and the size of the character set `a` (e.g., 26 for lowercase letters).

// Example usage
let solution = Solution()
print(solution.lengthOfLongestSubstring("abcabcbb"))  // Output: 3
print(solution.lengthOfLongestSubstring("bbbbb"))     // Output: 1
print(solution.lengthOfLongestSubstring("pwwkew"))    // Output: 3
print(solution.lengthOfLongestSubstring(""))          // Output: 0
print(solution.lengthOfLongestSubstring(" "))         // Output: 1
print(solution.lengthOfLongestSubstring("dvdf"))      // Output: 3
