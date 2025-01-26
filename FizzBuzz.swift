class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        // Initialize an empty array to store the result
        var result: [String] = []
        
        // Iterate from 1 to n
        for i in 1...n {
            // Check if the current number is divisible by both 3 and 5
            if i % 3 == 0 && i % 5 == 0 {
                result.append("FizzBuzz")
            }
            // Check if the current number is divisible by 3
            else if i % 3 == 0 {
                result.append("Fizz")
            }
            // Check if the current number is divisible by 5
            else if i % 5 == 0 {
                result.append("Buzz")
            }
            // Otherwise, add the number as a string
            else {
                result.append(String(i))
            }
        }
        
        // Return the final list
        return result
    }
}

// Explanation:
// Key Observations:
//     - Numbers divisible by both 3 and 5 are divisible by 15, so check for this first.
//     - Numbers divisible by 3 are replaced with "Fizz".
//     - Numbers divisible by 5 are replaced with "Buzz".
//     - Other numbers are converted to their string representation and added to the result.

// Approach:
//     1. Initialize an empty list to store the result.
//     2. Iterate from 1 to n:
//         - If the number is divisible by both 3 and 5, add "FizzBuzz".
//         - If the number is divisible by 3, add "Fizz".
//         - If the number is divisible by 5, add "Buzz".
//         - Otherwise, add the number as a string.
//     3. Return the result.

// Complexity Analysis:
// Time Complexity: O(n)
//     - We iterate through all numbers from 1 to n once, performing constant-time operations for each number.
// Space Complexity: O(n)
//     - The result array stores n strings.

// Example usage
let solution = Solution()
print(solution.fizzBuzz(3))  // Output: ["1", "2", "Fizz"]
print(solution.fizzBuzz(5))  // Output: ["1", "2", "Fizz", "4", "Buzz"]
print(solution.fizzBuzz(15)) // Output: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]
print(solution.fizzBuzz(1))  // Output: ["1"]
print(solution.fizzBuzz(20)) // Output: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz"]
