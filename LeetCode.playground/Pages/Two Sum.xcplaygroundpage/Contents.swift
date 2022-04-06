//: [Previous](@previous)

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] { // лучший вариант
        var dict = Dictionary<Int, Int>()
        for index in 0..<nums.count {
            if let foundIndex = dict[target - nums[index]] {
                return [foundIndex, index]
            } else {
                dict[nums[index]] = index
            }
        }
        return []
    }
}

let sol = Solution()
print(sol.twoSum([3,2,4], 6))


//: [Next](@next)
