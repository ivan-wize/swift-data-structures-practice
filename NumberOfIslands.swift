class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        // Check if the grid is empty
        if grid.isEmpty { return 0 }
        
        // Convert the grid to a mutable grid
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        
        // Function to perform DFS to mark connected land as visited
        func dfs(_ r: Int, _ c: Int) {
            // Base case: If out of bounds or already visited, return
            if r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] == "0" {
                return
            }
            
            // Mark the current cell as visited by setting it to "0"
            grid[r][c] = "0"
            
            // Visit all 4 neighboring cells (up, down, left, right)
            dfs(r - 1, c) // Up
            dfs(r + 1, c) // Down
            dfs(r, c - 1) // Left
            dfs(r, c + 1) // Right
        }
        
        // Initialize the number of islands
        var numIslands = 0
        
        // Iterate over every cell in the grid
        for r in 0..<rows {
            for c in 0..<cols {
                // If the cell is land ("1"), it's a new island
                if grid[r][c] == "1" {
                    numIslands += 1 // Increment the island count
                    dfs(r, c) // Use DFS to mark all connected land as visited
                }
            }
        }
        
        return numIslands
    }
}

// Explanation:
// Key Observations:
// - Each "1" in the grid represents land, and "0" represents water.
// - Connected land cells (horizontally or vertically) form an island.
// - Use Depth-First Search (DFS) to mark all connected "1" cells as visited by setting them to "0".

// Approach:
// 1. Iterate through the grid:
//     - For each cell with value "1", it represents the start of a new island.
//     - Perform DFS from that cell to mark all connected "1" cells as "0".
//     - Increment the island count for every new "1" found.
// 2. DFS recursively visits all valid neighbors (up, down, left, right) and marks them as "0".
// 3. Return the total number of islands after processing the entire grid.

// Complexity Analysis:
// Time Complexity: O(m * n)
//     - m is the number of rows, n is the number of columns in the grid.
//     - Each cell is visited once during iteration and once during DFS (at most).
// Space Complexity: O(m * n)
//     - The recursion stack for DFS can grow up to O(m * n) in the worst case (all cells are "1").

// Example usage
let solution = Solution()

let grid1: [[Character]] = [
    ["1", "1", "1", "1", "0"],
    ["1", "1", "0", "1", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "0", "0", "0"]
]
print(solution.numIslands(grid1)) // Output: 1

let grid2: [[Character]] = [
    ["1", "1", "0", "0", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "1", "0", "0"],
    ["0", "0", "0", "1", "1"]
]
print(solution.numIslands(grid2)) // Output: 3

let grid3: [[Character]] = []
print(solution.numIslands(grid3)) // Output: 0

let grid4: [[Character]] = [["1"]]
print(solution.numIslands(grid4)) // Output: 1
