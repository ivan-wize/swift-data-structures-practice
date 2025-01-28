// Swift Cheat Sheet for Development Engineer in Test Position

import Foundation

// MARK: - Variables and Constants
// Use 'let' for constants and 'var' for variables
let constantValue = 10  // A constant cannot be changed after it's assigned
var variableValue = 20  // A variable can be updated after it's assigned

// MARK: - Optionals and Unwrapping
// Optionals represent values that might be nil. Use '?' to define an optional.
var optionalString: String? = "Hello, Swift!" // Optional string can hold a string or nil

// Unwrapping optionals safely using if-let
if let unwrappedString = optionalString {
    print("Unwrapped String: \(unwrappedString)") // Executes if optionalString has a value
} else {
    print("optionalString is nil")
}

// MARK: - Functions
// Basic function
func greet(name: String) -> String {
    return "Hello, \(name)!" // Returns a greeting message
}
print(greet(name: "Ivan"))

// Function with default parameters
func multiply(a: Int, b: Int = 2) -> Int {
    return a * b // Multiplies two numbers, b defaults to 2 if not provided
}
print(multiply(a: 5)) // Output: 10

// MARK: - Closures
// Closures are self-contained blocks of code that can be passed around and used in your code.
// Syntax: { (parameters) -> ReturnType in statements }

// Example: Closure that adds two integers
let closureExample = { (a: Int, b: Int) -> Int in
    return a + b // This closure takes two integers and returns their sum
}
print(closureExample(3, 5)) // Output: 8

// Closures can also be shorthand. If the closure's type is already known, you can simplify:
let shorthandClosure: (Int, Int) -> Int = { $0 + $1 } // Uses $0 and $1 for shorthand parameters
print(shorthandClosure(3, 5)) // Output: 8

// MARK: - Common Algorithms
// Two Sum
func twoSum(nums: [Int], target: Int) -> [Int]? {
    var seen: [Int: Int] = [:] // Dictionary to store seen numbers and their indices
    for (i, num) in nums.enumerated() {
        let diff = target - num
        if let index = seen[diff] {
            return [index, i] // Return the indices if a match is found
        }
        seen[num] = i
    }
    return nil
}
print(twoSum(nums: [2, 7, 11, 15], target: 9) ?? []) // Output: [0, 1]

// Valid Parentheses
func isValidParentheses(_ s: String) -> Bool {
    var stack: [Character] = []
    let mapping: [Character: Character] = [")": "(", "}": "{", "]": "["]
    for char in s {
        if let match = mapping[char] {
            if stack.popLast() != match {
                return false
            }
        } else {
            stack.append(char)
        }
    }
    return stack.isEmpty
}
print(isValidParentheses("{[()]}") ? "Valid" : "Invalid") // Output: Valid

// Reverse a String
func reverseString(_ s: String) -> String {
    return String(s.reversed()) // Reverses the string
}
print(reverseString("apple")) // Output: elppa

// Fibonacci (Dynamic Programming)
func fib(_ n: Int) -> Int {
    var memo: [Int: Int] = [0: 0, 1: 1] // Memoization dictionary
    func helper(_ n: Int) -> Int {
        if let result = memo[n] {
            return result
        }
        memo[n] = helper(n - 1) + helper(n - 2)
        return memo[n]!
    }
    return helper(n)
}
print(fib(10)) // Output: 55

// Binary Search
func binarySearch(_ array: [Int], _ target: Int) -> Int? {
    var left = 0, right = array.count - 1
    while left <= right {
        let mid = (left + right) / 2
        if array[mid] == target {
            return mid // Target found
        } else if array[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return nil // Target not found
}
print(binarySearch([1, 3, 5, 7, 9], 5) ?? -1) // Output: 2

// MARK: - Error Handling
// Define an error type
enum SampleError: Error {
    case invalidInput // Define a specific error case
}

// Throwing and catching errors
func checkInput(input: Int) throws {
    if input < 0 {
        throw SampleError.invalidInput // Throw an error if input is invalid
    }
}

do {
    try checkInput(input: -1) // Tries to run the function
} catch SampleError.invalidInput {
    print("Invalid input error caught.") // Catches the specific error
}

// MARK: - Classes and Structs
// Define a struct (value type)
struct Point {
    var x: Int
    var y: Int

    func distance() -> Double {
        return sqrt(Double(x * x + y * y)) // Calculates the distance from origin
    }
}
let point = Point(x: 3, y: 4)
print("Distance: \(point.distance())")

// Define a class (reference type)
class Circle {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func area() -> Double {
        return Double.pi * radius * radius // Calculates the area of the circle
    }
}
let circle = Circle(radius: 5)
print("Circle Area: \(circle.area())")

// MARK: - Protocols
// Protocols define a blueprint of methods, properties, or other requirements
protocol Drawable {
    func draw() // Method to be implemented by conforming types
}

class Square: Drawable {
    func draw() {
        print("Drawing a square")
    }
}
let square = Square()
square.draw()

// MARK: - Extensions
// Extensions add new functionality to an existing class, struct, or type
extension String {
    func reversedString() -> String {
        return String(self.reversed()) // Returns the reversed version of the string
    }
}
print("Swift".reversedString()) // Output: tfiwS

// MARK: - Collections
// Arrays
var array = [1, 2, 3]
array.append(4) // Adds a new element to the array
print(array) // Output: [1, 2, 3, 4]

// Dictionaries
var dictionary = ["key": "value"]
dictionary["key2"] = "value2" // Adds a new key-value pair
print(dictionary)

// MARK: - Higher-Order Functions
// Higher-order functions take a function as an argument or return a function
let numbers = [1, 2, 3, 4, 5]

// Map: Transforms each element in the collection
let squaredNumbers = numbers.map { $0 * $0 }
print(squaredNumbers) // Output: [1, 4, 9, 16, 25]

// Filter: Filters elements based on a condition
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers) // Output: [2, 4]

// Reduce: Combines all elements into a single value
let sum = numbers.reduce(0, +)
print(sum) // Output: 15

// MARK: - Asynchronous Code
// Async/Await Example
func fetchData() async throws -> String {
    // Simulate network delay
    try await Task.sleep(nanoseconds: 1_000_000_000) // Pauses for 1 second
    return "Fetched Data"
}

Task {
    do {
        let data = try await fetchData()
        print(data) // Output: "Fetched Data"
    } catch {
        print("Error: \(error)")
    }
}

// MARK: - Unit Testing
// Example function for testing
func add(a: Int, b: Int) -> Int {
    return a + b // Adds two integers
}
// You can test this function using XCTest framework
// Example:
// XCTAssertEqual(add(a: 2, b: 3), 5)

// MARK: - Memory Management
// Example of weak and strong references
class Node {
    var value: Int
    weak var next: Node? // Weak reference prevents strong reference cycles

    init(value: Int) {
        self.value = value
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
node1.next = node2

// MARK: - Conclusion
// This cheat sheet provides a quick overview of important Swift concepts and functions.
// Practice these topics to prepare effectively for your interview.
