class Solution {
    // Basic Approach: Count all bits by shifting
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var count = 0
        
        // Process each bit
        while n != 0 {
            // Check if the least significant bit is 1
            count += n & 1
            // Right shift the bits by 1 to process the next bit
            n >>= 1
        }
        
        return count
    }
    
    // Optimized Approach: Using Brian Kernighan’s Algorithm
    func hammingWeightOptimized(_ n: Int) -> Int {
        var n = n
        var count = 0
        
        // Remove the rightmost set bit in each iteration
        while n != 0 {
            n &= (n - 1) // Clears the least significant set bit
            count += 1
        }
        
        return count
    }
}

// Explanation:
// Key Observations:
// - A "set bit" is a bit with a value of 1.
// - Using bitwise operations, we can efficiently count the number of set bits in an integer.

// Basic Approach:
// - Use a loop to check the least significant bit (LSB) of the integer using `n & 1`.
// - Right shift the integer by 1 (`n >>= 1`) to process the next bit.
// - Time Complexity: O(k), where k is the number of bits in the integer (log(n) base 2).
// - Space Complexity: O(1), since no additional data structures are used.

// Optimized Approach (Brian Kernighan’s Algorithm):
// - Instead of processing all bits, directly skip over unset bits (0).
// - The operation `n = n & (n - 1)` removes the rightmost set bit, reducing the total number of iterations to the number of set bits.
// - Time Complexity: O(set bits), where the number of iterations equals the number of set bits.
// - Space Complexity: O(1).

// Example usage
let solution = Solution()

// Test case 1: Simple binary with a few set bits
print(solution.hammingWeight(11))  // Output: 3
print(solution.hammingWeightOptimized(11))  // Output: 3

// Test case 2: Power of 2
print(solution.hammingWeight(128))  // Output: 1
print(solution.hammingWeightOptimized(128))  // Output: 1

// Test case 3: Large number
print(solution.hammingWeight(2147483645))  // Output: 30
print(solution.hammingWeightOptimized(2147483645))  // Output: 30

// Test case 4: All bits set (32-bit max value)
print(solution.hammingWeight(Int(UInt32.max)))  // Output: 32
print(solution.hammingWeightOptimized(Int(UInt32.max)))  // Output: 32
