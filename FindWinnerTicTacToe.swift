class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        // Initialize a 3x3 grid with empty strings
        var grid = Array(repeating: Array(repeating: "", count: 3), count: 3)
        
        // Fill the grid with the moves alternately for players A and B
        for (i, move) in moves.enumerated() {
            let row = move[0]
            let col = move[1]
            grid[row][col] = i % 2 == 0 ? "X" : "O"
        }
        
        // Helper function to check for a winner
        func checkWinner(_ player: String) -> Bool {
            // Check rows and columns
            for i in 0..<3 {
                if (grid[i].allSatisfy { $0 == player }) ||  // Check row
                   (grid.map { $0[i] }.allSatisfy { $0 == player }) {  // Check column
                    return true
                }
            }
            // Check diagonals
            if (0..<3).allSatisfy({ grid[$0][$0] == player }) ||  // Top-left to bottom-right diagonal
               (0..<3).allSatisfy({ grid[$0][2 - $0] == player }) {  // Top-right to bottom-left diagonal
                return true
            }
            return false
        }
        
        // Determine the winner
        if checkWinner("X") {
            return "A"
        } else if checkWinner("O") {
            return "B"
        }
        
        // If all moves have been made and there's no winner, it's a draw
        if moves.count == 9 {
            return "Draw"
        }
        
        // Otherwise, the game is still pending
        return "Pending"
    }
}

// Explanation:
// Key Observations:
//     - The game grid is a fixed 3x3 matrix that starts empty.
//     - Players alternate turns:
//         - Player A places "X" on even turns (0, 2, 4, ...).
//         - Player B places "O" on odd turns (1, 3, 5, ...).
//     - To determine the winner:
//         - Check all rows, columns, and diagonals to see if they contain the same character (X or O).
//     - If all moves are made and there's no winner, return "Draw".
//     - Otherwise, return "Pending" if the game is incomplete.

// Complexity Analysis:
// Time Complexity: O(1) (Constant)
//     - The grid is fixed at 3x3, so checking rows, columns, and diagonals involves a constant number of operations.
// Space Complexity: O(1)
//     - The grid is the only additional data structure, and its size is constant.

// Example usage
let solution = Solution()

// Test cases
print(solution.tictactoe([[0, 0], [2, 0], [1, 1], [2, 1], [2, 2]]))  // Output: "A"
print(solution.tictactoe([[0, 0], [1, 1], [0, 1], [0, 2], [2, 0], [1, 0], [2, 1], [1, 2], [2, 2]]))  // Output: "Draw"
print(solution.tictactoe([[0, 0], [1, 1]]))  // Output: "Pending"
