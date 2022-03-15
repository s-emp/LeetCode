/// Решение которое почему-то при таких данных падает в LeetCode
//class Solution {
//    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//        var count = 0
//        var lastCorrectIndex = nums.count - 1
//        for (index, num) in nums.enumerated() where num == val {
//            count += 1
//            while nums[lastCorrectIndex] == val && lastCorrectIndex > index {
//                lastCorrectIndex -= 1
//            }
//            guard index < lastCorrectIndex else { break }
//            nums.swapAt(index, lastCorrectIndex)
//            lastCorrectIndex -= 1
//        }
//        return count
//    }
//}

//let sol = Solution()
//var nums = [0,1,2,2,3,0,4,2]
//let result = sol.removeElement(&nums, 2)
//print(nums)
//print(result)
//print("Sol: \(nums == [0,1,4,0,3,2,2,2])")

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums.removeAll(where: { $0 == val })
        return nums.count
    }
}

let sol = Solution()
var nums = [0,1,2,2,3,0,4,2]
let result = sol.removeElement(&nums, 2)
print(nums)
print(result)
print("Sol: \(nums == [0,1,3,0,4])")

