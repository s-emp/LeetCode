//
//  RemoveDuplicatesFromSortedArray.swift
//  LeetCodeV2
//
//  Created by Сергей Мельников on 14.04.2022.
//

class RemoveDuplicatesFromSortedArray {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var numsResult = [nums[0]]
        let range = 1..<nums.count
        for index in range where nums[index] != numsResult.last! {
            numsResult.append(nums[index])
        }
        nums = numsResult
        return nums.count
    }
    
    static func tests() {
        print("Start tests RemoveDuplicatesFromSortedArray")
        let v = RemoveDuplicatesFromSortedArray()
        var nums = [1,1,2]
        var result = v.removeDuplicates(&nums)
        print(nums == [1,2] && result == 2 ? "Yes": "No")
        nums = [0,0,1,1,1,2,2,3,3,4]
        result = v.removeDuplicates(&nums)
        print(nums == [0,1,2,3,4] && result == 5 ? "Yes": "No")
        print("End tests RemoveDuplicatesFromSortedArray")
    }
}
