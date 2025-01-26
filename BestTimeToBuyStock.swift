class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // Initialize variables
        var minPrice = Int.max  // Track the minimum price seen so far
        var maxProfit = 0       // Track the maximum profit
        
        // Iterate through the prices
        for price in prices {
            // Update the minimum price if the current price is lower
            if price < minPrice {
                minPrice = price
            } else {
                // Calculate profit if selling at the current price
                let profit = price - minPrice
                // Update the maximum profit if this profit is higher
                maxProfit = max(maxProfit, profit)
            }
        }
        
        // Return the maximum profit
        return maxProfit
    }
}

// Explanation:
// Key Observations:
//     To maximize profit, buy at the lowest price seen so far and sell at the highest price after that.
//     Keep track of:
//       - The minimum price encountered while iterating through the array (`minPrice`).
//       - The maximum profit calculated so far (`maxProfit`).

// Approach:
//     1. Initialize Variables:
//         - Set `minPrice` to the largest possible integer (`Int.max` in Swift).
//         - Set `maxProfit` to 0.
//     2. Iterate Through Prices:
//         - Update `minPrice` if the current price is lower than `minPrice`.
//         - Calculate the profit by subtracting `minPrice` from the current price.
//         - Update `maxProfit` if the calculated profit is greater than the current `maxProfit`.
//     3. Return Result:
//         - Return `maxProfit` after processing all prices.

// Time Complexity:
//     O(n), where n is the number of prices in the list.
//     - We iterate through the list of prices once.
// Space Complexity:
//     O(1), as we use only two variables (`minPrice` and `maxProfit`).

// Test cases
let solution = Solution()

let prices1 = [7, 1, 5, 3, 6, 4]
print(solution.maxProfit(prices1))  // Output: 5

let prices2 = [7, 6, 4, 3, 1]
print(solution.maxProfit(prices2))  // Output: 0

let prices3 = [2, 4, 1]
print(solution.maxProfit(prices3))  // Output: 2

let prices4 = [1]
print(solution.maxProfit(prices4))  // Output: 0

let prices5 = [1, 2]
print(solution.maxProfit(prices5))  // Output: 1
