//
//  RomanToInteger.swift
//  LeetCodeV2
//
//  Created by Сергей Мельников on 09.04.2022.
//


class RomanToInteger {
    
    static let romanInteger: [ReversedCollection<String>.Element: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000,
    ]
    
    func romanToInt(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let rev = s.reversed()
        var currentValue: Int = RomanToInteger.romanInteger[rev.first!]!
        var interator = rev.makeIterator()
        var sum = 0
        while let nextChapter = interator.next() {
            let value = RomanToInteger.romanInteger[nextChapter]!
            guard currentValue <= value else {
                sum -= value
                continue
            }
            sum += value
            currentValue = value
        }
        return sum
    }
    
    static func tests() {
        let v = RomanToInteger()
        print("Start tests RomanToInteger")
        print(v.romanToInt("III") == 3 ? "Yes" : "No")
        print(v.romanToInt("LVIII") == 58 ? "Yes" : "No")
        print(v.romanToInt("MCMXCIV") == 1994 ? "Yes" : "No")
        print("End tests RomanToInteger")
    }
}
