// 1089. Duplicate Zeros
// Given a fixed-length integer array arr, duplicate each occurrence of zero, shifting the remaining elements to the right.
//
// Note that elements beyond the length of the original array are not written. Do the above modifications to the input array in place and do not return anything.

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var offset = 0
        for (index, value) in arr.enumerated() where value == 0 {
            arr.insert(0, at: index + offset)
            offset += 1
        }
        arr.removeLast(offset)
    }
}
