import Foundation

class Solution {
    
    init() {}
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        var tempDict: [Int:Int] = [:]
        
        for (_, value) in nums.enumerated() {
            // Kept all the values to dictionary keys, and kept these values duplication counts, It is actually unnecessary
            tempDict[value] = (tempDict[value] ?? 0) + 1
        }
        
        let newNums = tempDict.keys.map({ $0 }) // Get all the keys
        nums = newNums.sorted() // Sort it
        return tempDict.keys.count // and get the keys count
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        var maxProfit = 0
        for (index,_) in prices.enumerated() {
            
            if index >= 1 {
                let current = prices[index]
                let previous = prices[index - 1]
                // Compare with the previous one and decide the profit
                if current > previous {
                    maxProfit += current - previous
                }
            }
            
        }
        
        return maxProfit
    }
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        var n = k
        n %= nums.count
        nums = nums.reversed()
        let firstPart = Array(nums.suffix(nums.count - n).reversed())
        var lastPart = Array(nums.prefix(n).reversed())
        lastPart.append(contentsOf: firstPart)
        nums = lastPart
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var tempDict: [Int:Int] = [:]
        
        for (_, value) in nums.enumerated() {
            tempDict[value] = (tempDict[value] ?? 0) + 1
        }
        
        return tempDict.values.map({ $0 > 1 }).contains(true)
    }
    
    func singleNumber(_ nums: [Int]) -> Int {
        
        var temp: [Int: Int] = [0: 0]
        
        for (_, item) in nums.enumerated() {
            temp[item] = ((temp[item] ?? 0) + 1) // get the duplicates key, and duplicated value
        }
        
        let res = temp.filter({ $0.value == 1 }) // find the lonely one
        return res.keys.first ?? 0 // and get that lonely one's key
    }
    
}
