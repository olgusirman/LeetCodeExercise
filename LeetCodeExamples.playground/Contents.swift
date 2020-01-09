import UIKit

var nums = [4,1,2,1,2]

struct Solution {
    
    func singleNumber(_ nums: [Int]) -> Int {
        
        var temp: [Int: Int] = [0: 0]
        
        for (_, item) in nums.enumerated() {
            temp[item] = ((temp[item] ?? 0) + 1)
        }
        
        let res = temp.filter({ $0.value == 1 })
        return res.keys.first ?? 0
    }
    
}

let sol = Solution()
sol.singleNumber(nums)
