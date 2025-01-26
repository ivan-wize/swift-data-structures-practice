class Solution {
    // Using Dictionary (Hash Map) Approach
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // Anagrams must have the same length
        if s.count != t.count {
            return false
        }

        // Create dictionaries to count the frequency of each character
        var countS = [Character: Int]()
        var countT = [Character: Int]()

        // Count characters in string s
        for char in s {
            countS[char, default: 0] += 1
        }

        // Count characters in string t
        for char in t {
            countT[char, default: 0] += 1
        }

        // Compare the two dictionaries
        return countS == countT
    }

    // Optimized Approach Using Sorting
    func isAnagramUsingSorting(_ s: String, _ t: String) -> Bool {
        // Sort both strings and compare them
        return s.sorted() == t.sorted()
    }
}

// Explanation:
// Using Dictionary:
// - Anagrams are strings that contain the same characters with the same frequencies, but potentially in a different order.
// - We can verify anagrams by counting the frequency of each character in both strings and then comparing these counts.

// Approach:
// 1. Check if the lengths of s and t are equal. If not, they cannot be anagrams.
// 2. Use two dictionaries to count the occurrences of each character in both strings.
// 3. Compare the dictionaries. If they are equal, the strings are anagrams.

// Using Sorting:
// - Sorting rearranges the characters in both strings in the same order. 
// - If the sorted versions of the strings are identical, then the strings are anagrams.

// Complexity Analysis:
// Using Dictionaries:
// - Time Complexity: O(n), where n is the length of the strings (since we’re counting characters).
// - Space Complexity: O(1), assuming the character set is fixed (like 26 lowercase English letters).
// Using Sorting:
// - Time Complexity: O(n log n), due to the sorting process.
// - Space Complexity: O(n), because sorted() creates a new array.

// Example usage
let solution = Solution()
print(solution.isAnagram("anagram", "nagaram"))  // Output: true
print(solution.isAnagram("rat", "car"))          // Output: false
print(solution.isAnagram("a", "aa"))             // Output: false
print(solution.isAnagram("你好", "好你"))          // Output: true
print(solution.isAnagram("", ""))                // Output: true
print(solution.isAnagramUsingSorting("anagram", "nagaram"))  // Output: true
print(solution.isAnagramUsingSorting("rat", "car"))          // Output: false
