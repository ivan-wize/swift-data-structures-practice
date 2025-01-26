class Solution {
    func reverseBits(_ n: Int) -> Int {
        // Initialize the result to 0
        var result = 0
        var n = n
        
        // Iterate over 32 bits
        for _ in 0..<32 {
            // Extract the least significant bit of n (n & 1)
            let bit = n & 1
            
            // Left shift the result to make room for the new bit
            result = (result << 1) | bit
            
            // Right shift n to process the next bit
            n = n >> 1
        }
        
        return result
    }
}

// Explanation:
// Key Observations:
// - The input `n` is treated as a 32-bit unsigned integer.
// - Reversing the bits means reading each bit from the least significant bit (LSB) to the most significant bit (MSB) and placing them in reverse order in the result.

// Approach:
// 1. Initialize `result = 0`.
// 2. For each of the 32 bits in `n`:
//    - Extract the least significant bit using `n & 1`.
//    - Left shift `result` to make space for the new bit.
//    - Append the extracted bit to `result` using the bitwise OR (`|`).
//    - Right shift `n` to move to the next bit.
// 3. Return the reversed 32-bit result.

// Complexity Analysis:
// Time Complexity: O(32)
// - The loop runs exactly 32 times, as we process each bit of the 32-bit integer.
// Space Complexity: O(1)
// - No additional data structures are used; the operations are performed in-place.

// Example usage
let solution = Solution()
print(solution.reverseBits(43261596))  // Output: 964176192
print(solution.reverseBits(4294967293)) // Output: 3221225471
print(solution.reverseBits(0))          // Output: 0
print(solution.reverseBits(1))          // Output: 2147483648
