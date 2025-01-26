class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // Edge case: If the input list is empty, return an empty string
        if strs.isEmpty {
            return ""
        }
        
        // Start by assuming the first string is the common prefix
        var prefix = strs[0]
        
        // Compare the prefix with each string in the list
        for string in strs.dropFirst() {
            // Reduce the prefix while it doesn't match the start of the current string
            while !string.hasPrefix(prefix) {
                // Gradually shorten the prefix by removing the last character
                prefix.removeLast()
                
                // If the prefix becomes empty, there's no common prefix
                if prefix.isEmpty {
                    return ""
                }
            }
        }
        
        // Return the longest common prefix after processing all strings
        return prefix
    }
}

// Explanation:
// Key Observations:
//     - The longest common prefix is the largest prefix that is shared among all strings in the list.
//     - By starting with the first string as the prefix and reducing it as necessary, we can find the answer efficiently.

// Approach:
//     1. Handle the edge case where the input list is empty. Return an empty string if there are no strings.
//     2. Assume the first string is the prefix.
//     3. Iterate through the remaining strings and check if they start with the current prefix:
//         - If not, shorten the prefix by removing its last character until it matches the start of the current string.
//         - If the prefix becomes empty, return an empty string because there is no common prefix.
//     4. Return the resulting prefix after processing all strings.

// Complexity Analysis:
// Time Complexity: O(n * m)
//     - n: Number of strings in the input list.
//     - m: Length of the longest string in the input.
//     - In the worst case, we may compare every character of every string, leading to O(n * m).
// Space Complexity: O(1)
//     - We only use a constant amount of extra space for the `prefix` variable.

// Example usage
let solution = Solution()
print(solution.longestCommonPrefix(["flower", "flow", "flight"]))  // Output: "fl"
print(solution.longestCommonPrefix(["dog", "racecar", "car"]))     // Output: ""
print(solution.longestCommonPrefix(["interspecies", "interstellar", "interstate"])) // Output: "inters"
print(solution.longestCommonPrefix([""]))                          // Output: ""
print(solution.longestCommonPrefix(["a"]))                         // Output: "a"
print(solution.longestCommonPrefix(["abc", "abc", "abc"]))         // Output: "abc"
