//: [Previous](@previous)

import Foundation

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dict = [Character: Character]()
        var useCharacter = Set<Character>()
        var sIterator = s.makeIterator(), tIterator = t.makeIterator()
        while let sNextCharacter = sIterator.next(), let tNextCharacter = tIterator.next() {
            if let key = dict[sNextCharacter] {
                guard key == tNextCharacter else { return false }
                continue
            } else {
                if useCharacter.contains(tNextCharacter) { return false }
                useCharacter.insert(tNextCharacter)
                dict[sNextCharacter] = tNextCharacter
            }
        }
        return true
    }
}



//: [Next](@next)
