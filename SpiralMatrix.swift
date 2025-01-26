class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        // List to store the result
        var result: [Int] = []
        
        // Define the boundaries of the matrix
        var top = 0, bottom = matrix.count - 1 // Top and bottom rows
        var left = 0, right = matrix[0].count - 1 // Left and right columns
        
        // Traverse the matrix in spiral order
        while top <= bottom && left <= right {
            // Traverse from left to right across the top row
            for i in left...right {
                result.append(matrix[top][i])
            }
            top += 1 // Move the top boundary down
            
            // Traverse from top to bottom along the right column
            for i in top...bottom {
                result.append(matrix[i][right])
            }
            right -= 1 // Move the right boundary left
            
            // Check if there are still rows to traverse
            if top <= bottom {
                // Traverse from right to left across the bottom row
                for i in stride(from: right, through: left, by: -1) {
                    result.append(matrix[bottom][i])
                }
                bottom -= 1 // Move the bottom boundary up
            }
            
            // Check if there are still columns to traverse
            if left <= right {
                // Traverse from bottom to top along the left column
                for i in stride(from: bottom, through: top, by: -1) {
                    result.append(matrix[i][left])
                }
                left += 1 // Move the left boundary right
            }
        }
        
        return result
    }
}

// Explanation:
// Key Observations:
// - The matrix is traversed in four steps (in a loop):
//   1. Left to Right (Top Row)
//   2. Top to Bottom (Right Column)
//   3. Right to Left (Bottom Row)
//   4. Bottom to Top (Left Column)
// - After each step, the boundaries (`top`, `bottom`, `left`, `right`) are updated to move inward.

// Approach:
// 1. Define the boundaries of the matrix (`top`, `bottom`, `left`, `right`).
// 2. Use a loop to traverse the matrix while the boundaries are valid (`top <= bottom` and `left <= right`).
// 3. Perform the four traversal steps and update the boundaries accordingly.
// 4. Return the `result` list containing the spiral order traversal.

// Complexity Analysis:
// Time Complexity: O(m * n)
// - Each element of the matrix is visited exactly once, where `m` is the number of rows and `n` is the number of columns.
// Space Complexity: O(1)
// - No additional data structures are used except for the `result` list.

// Example usage
let solution = Solution()

let matrix1 = [[1, 2, 3],
               [4, 5, 6],
               [7, 8, 9]]
print(solution.spiralOrder(matrix1))  // Output: [1, 2, 3, 6, 9, 8, 7, 4, 5]

let matrix2 = [[1, 2, 3, 4],
               [5, 6, 7, 8],
               [9, 10, 11, 12]]
print(solution.spiralOrder(matrix2))  // Output: [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]

let matrix3 = [[1, 2, 3, 4]]
print(solution.spiralOrder(matrix3))  // Output: [1, 2, 3, 4]

let matrix4 = [[1], [2], [3], [4]]
print(solution.spiralOrder(matrix4))  // Output: [1, 2, 3, 4]

let matrix5 = [[1]]
print(solution.spiralOrder(matrix5))  // Output: [1]
