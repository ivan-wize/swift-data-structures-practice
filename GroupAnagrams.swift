class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // A dictionary to group anagrams, using sorted strings as keys
        var anagramMap: [String: [String]] = [:]
        
        // Iterate over each string in the list
        for string in strs {
            // Sort the characters of the string to get the key
            // By sorting, all anagrams will produce the same key
            let key = String(string.sorted())
            
            // If the key is not in the dictionary, initialize an empty list
            if anagramMap[key] == nil {
                anagramMap[key] = []
            }
            
            // Append the original string to the corresponding list
            anagramMap[key]!.append(string)
        }
        
        // Return the values of the dictionary as the grouped anagrams
        return Array(anagramMap.values)
    }
}

// Explanation:
// Key Observations:
//     - Anagrams contain the exact same characters in any order.
//     - By sorting the characters of a string, all anagrams will have the same sorted string as their key.
//       For example:
//         "eat" → "aet"
//         "tea" → "aet"
//         "ate" → "aet"
//     - Use a dictionary to group anagrams:
//         - The key is the sorted string.
//         - The value is a list of all original strings that match the sorted key.

// Approach:
//     1. Create a dictionary (`anagramMap`) to group strings based on their sorted character sequences.
//     2. For each string in the input array:
//         - Sort the characters of the string to create a key.
//         - Add the string to the corresponding group in the dictionary.
//     3. Return all the values in the dictionary as a list of groups.

// Time Complexity:
//     Sorting each string takes O(k log k), where k is the length of the string.
//     If there are n strings in `strs`, the total time complexity is O(n * k log k).

// Space Complexity:
//     The dictionary `anagramMap` requires O(n * k) space to store all strings and their keys.

// Example usage
let solution = Solution()

print(solution.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
// Output: [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]

print(solution.groupAnagrams([""]))
// Output: [[""]]

print(solution.groupAnagrams(["a"]))
// Output: [["a"]]

print(solution.groupAnagrams(["abc", "bca", "cab", "xyz", "zyx"]))
// Output: [["abc", "bca", "cab"], ["xyz", "zyx"]]
