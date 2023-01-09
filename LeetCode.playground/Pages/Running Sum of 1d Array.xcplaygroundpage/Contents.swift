//: [Previous](@previous)

import Foundation

class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        nums.reduce(0) { sum, num in
            result.append(sum + num)
            return sum + num
        }
        return result
    }
}

//: [Next](@next)
