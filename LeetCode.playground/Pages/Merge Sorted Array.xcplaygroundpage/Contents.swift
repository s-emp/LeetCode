class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1.removeLast(n)
        var result = [Int](repeating: 0, count: m + n)
        var index1 = 0, index2 = 0
        for (i, _) in result.enumerated() {
            guard index1 < nums1.count else {
                result[i] = nums2[index2]
                index2 += 1
                continue
            }
            guard index2 < nums2.count else {
                result[i] = nums1[index1]
                index1 += 1
                continue
            }
            if nums1[index1] < nums2[index2] {
                result[i] = nums1[index1]
                index1 += 1
            } else {
                result[i] = nums2[index2]
                index2 += 1
            }
        }
        nums1 = result
    }
}

let sol = Solution()
var num1 = [1,2,3,0,0,0]
sol.merge(&num1, 3, [2,5,6], 3)
num1
print("Test: \(num1 == [1,2,2,3,5,6])")

var num2 = [1,2]
num2.insert(6, at: 0)
