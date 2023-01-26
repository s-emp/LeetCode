//: [Previous](@previous)

import Foundation

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var sIterator = s.makeIterator(), tIterator = t.makeIterator()
        while let sNext = sIterator.next() {
            var result = false
            while let tNext = tIterator.next() {
                if tNext == sNext { result = true; break }
            }
            if result == false { return false }
        }
        return true
    }
}

//: [Next](@next)
