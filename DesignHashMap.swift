class MyHashMap {
    private var size: Int
    private var buckets: [[(Int, Int)]]
    
    init() {
        // Initialize the data structure with a fixed-size bucket array.
        // Each bucket is a list of key-value pairs to handle collisions.
        self.size = 1000
        self.buckets = Array(repeating: [], count: size)
    }
    
    private func hash(_ key: Int) -> Int {
        // Hash function to compute the index for the key.
        return key % size
    }
    
    func put(_ key: Int, _ value: Int) {
        // Compute the bucket index using the hash function
        let index = hash(key)
        var bucket = buckets[index]
        
        // Check if the key already exists in the bucket
        for i in 0..<bucket.count {
            if bucket[i].0 == key {
                // Update the value if the key exists
                bucket[i] = (key, value)
                buckets[index] = bucket  // Update the bucket in the array
                return
            }
        }
        
        // If the key is not found, append it to the bucket
        bucket.append((key, value))
        buckets[index] = bucket  // Update the bucket in the array
    }
    
    func get(_ key: Int) -> Int {
        // Compute the bucket index using the hash function
        let index = hash(key)
        let bucket = buckets[index]
        
        // Search for the key in the bucket
        for (k, v) in bucket {
            if k == key {
                return v
            }
        }
        
        // Key not found
        return -1
    }
    
    func remove(_ key: Int) {
        // Compute the bucket index using the hash function
        let index = hash(key)
        var bucket = buckets[index]
        
        // Search for the key and remove it
        for i in 0..<bucket.count {
            if bucket[i].0 == key {
                bucket.remove(at: i)
                buckets[index] = bucket  // Update the bucket in the array
                return
            }
        }
    }
}

// Explanation:
// Hash Function:
//     The `hash` method computes the bucket index by taking the modulo of the key with the number of buckets (key % size).

// Chaining Technique:
//     Each bucket is an array of key-value pairs.
//     When collisions occur (multiple keys map to the same index), they are stored in the same bucket.

// Operations:
//     - `put`: Inserts the key-value pair into the appropriate bucket. If the key already exists, updates its value.
//     - `get`: Searches for the key in the bucket and returns its value, or -1 if the key does not exist.
//     - `remove`: Searches for the key in the bucket and removes it if found.

// Complexity Analysis:
// Time Complexity:
//     - `put`: Average O(1), Worst O(n) (if all keys hash to the same bucket).
//     - `get`: Average O(1), Worst O(n).
//     - `remove`: Average O(1), Worst O(n).
//     The average-case complexity assumes that the hash function distributes keys uniformly across buckets.
// Space Complexity:
//     - O(n), where n is the number of keys stored in the HashMap.

// Example usage
let myHashMap = MyHashMap()

// Insert key-value pairs
myHashMap.put(1, 1)  // The map is now [[(1,1)]]
myHashMap.put(2, 2)  // The map is now [[(1,1)], [(2,2)]]

// Get values
print(myHashMap.get(1))  // Output: 1
print(myHashMap.get(3))  // Output: -1 (not found)

// Update an existing key
myHashMap.put(2, 1)  // The map is now [[(1,1)], [(2,1)]]

// Get updated value
print(myHashMap.get(2))  // Output: 1

// Remove a key
myHashMap.remove(2)  // The map is now [[(1,1)]]

// Attempt to get removed key
print(myHashMap.get(2))  // Output: -1 (not found)
