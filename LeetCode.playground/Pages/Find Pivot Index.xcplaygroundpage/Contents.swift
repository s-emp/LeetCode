//: [Previous](@previous)

// Нужно еще раз прорешать 724. Find Pivot Index

import Foundation

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        guard nums.count != 0 else { return -1 }
        guard nums.count > 1 else { return 0 }
        var sum = nums.reduce(0, +)
        var leftSum = 0
        for i in 0..<nums.count  {
            sum -= nums[i]
            if sum == leftSum { return i }
            leftSum += nums[i]
        }
        return -1
    }
}

let solution = Solution()
solution.sum([1,2,3,4], start: 1, end: 0)

//: [Next](@next)
