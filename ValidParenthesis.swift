class Solution {
    func isValid(_ s: String) -> Bool {
        // A stack to store opening brackets
        var stack: [Character] = []
        
        // A dictionary to map closing brackets to their corresponding opening brackets
        let bracketMap: [Character: Character] = [")": "(", "}": "{", "]": "["]
        
        // Iterate through each character in the string
        for char in s {
            if let openingBracket = bracketMap[char] {
                // If it's a closing bracket, check the stack
                let topElement = stack.popLast() ?? "#"  // Use "#" as a dummy value if the stack is empty
                
                // If the top element doesn't match the expected opening bracket, return false
                if topElement != openingBracket {
                    return false
                }
            } else {
                // If it's an opening bracket, push it onto the stack
                stack.append(char)
            }
        }
        
        // At the end, the stack should be empty if all brackets are matched
        return stack.isEmpty
    }
}

// Explanation:
// Key Observations:
//     A stack is ideal for solving this problem because it follows the Last In, First Out (LIFO) principle.
//     When we encounter an opening bracket, we push it onto the stack.
//     When we encounter a closing bracket, we check if the top of the stack has the corresponding opening bracket.
//     If not, the string is invalid. If the stack is empty after processing the string, the string is valid.

// Approach:
//     1. Stack Initialization:
//         - Use a stack to keep track of unmatched opening brackets.
//     2. Iterate Through String:
//         - For each character in the string:
//             - If it's a closing bracket, check if the top of the stack matches its corresponding opening bracket.
//             - If it's an opening bracket, push it onto the stack.
//     3. Validate the Stack:
//         - If the stack is empty after processing all characters, the string is valid. Otherwise, it's invalid.

// Time Complexity:
//     O(n), where n is the length of the string.
//     - Each character is processed once.
// Space Complexity:
//     O(n), for the stack in the worst case when all characters are opening brackets.

// Test cases
let solution = Solution()
print(solution.isValid("()"))        // Output: true
print(solution.isValid("()[]{}"))    // Output: true
print(solution.isValid("(]"))        // Output: false
print(solution.isValid("([)]"))      // Output: false
print(solution.isValid("{[]}"))      // Output: true
print(solution.isValid("["))         // Output: false
print(solution.isValid(""))          // Output: true
