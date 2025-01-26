class Solution {
    func minimumBoxes(_ apple: [Int], _ capacity: [Int]) -> Int {
        // Calculate the total number of apples
        // Use `reduce` to sum all elements in the `apple` array
        let totalApples = apple.reduce(0, +)
        
        // Sort the capacity array in descending order
        // This ensures we use the largest boxes first to minimize the number of boxes
        let sortedCapacity = capacity.sorted(by: >)
        
        // Initialize variables to track the number of boxes used and apples packed
        var boxesUsed = 0
        var applesPacked = 0
        
        // Iterate through the sorted capacity array
        for cap in sortedCapacity {
            // Use the current box
            applesPacked += cap
            boxesUsed += 1
            
            // Check if we have packed all apples
            if applesPacked >= totalApples {
                return boxesUsed
            }
        }
        
        // Return the number of boxes used
        return boxesUsed
    }
}

// Explanation:
// Key Observations:
//     To minimize the number of boxes used, we should prioritize boxes with the largest capacity.
//     By sorting the capacity array in descending order, we ensure that we use the largest boxes first.

// Approach:
//     1. Calculate Total Apples:
//         - Compute the sum of the `apple` array to determine the total number of apples that need to be packed.
//     2. Sort Capacities:
//         - Sort the `capacity` array in descending order to use the largest boxes first.
//     3. Pack Apples:
//         - Iterate through the sorted capacity array and add the capacity of each box to a running total (`applesPacked`).
//         - Keep track of the number of boxes used (`boxesUsed`).
//         - Stop as soon as `applesPacked` is greater than or equal to `totalApples`.
//     4. Return Result:
//         - Return the number of boxes used.

// Time Complexity:
//     Sorting the `capacity` array takes O(m log m), where m is the length of the `capacity` array.
//     Iterating through the `capacity` array takes O(m).
//     Total: O(m log m).

// Space Complexity:
//     O(1) (no additional data structures are used apart from variables).

// Test cases
let solution = Solution()
print(solution.minimumBoxes([1, 3, 2], [4, 3, 1, 5, 2]))  // Output: 2
print(solution.minimumBoxes([5, 5, 5], [2, 4, 2, 7]))     // Output: 4
print(solution.minimumBoxes([10, 20], [30, 10, 10]))      // Output: 2
print(solution.minimumBoxes([1], [1]))                    // Output: 1
print(solution.minimumBoxes([3, 3, 3], [9, 1, 1]))        // Output: 1
