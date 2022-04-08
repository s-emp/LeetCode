//
//  PalindromNumbers.swift
//  LeetCodeV2
//
//  Created by Сергей Мельников on 08.04.2022.
//

class PalindromeNumbers {
    func isPalindrome(_ x: Int) -> Bool {
        let str = "\(x)"
        var startIndex = str.startIndex
        var endIndex = str.index(str.endIndex, offsetBy: -1)
        while startIndex < endIndex {
            guard str[startIndex] == str[endIndex] else {
                return false
            }
            startIndex = str.index(startIndex, offsetBy: 1)
            endIndex = str.index(endIndex, offsetBy: -1)
        }
        return true
    }
    
    static func tests() {
        let v = PalindromeNumbers()
        print(v.isPalindrome(121) ? "Yes": "No")
        print(v.isPalindrome(-121) ? "No": "Yes")
        print(v.isPalindrome(1212) ? "No": "Yes")
        print(v.isPalindrome(1221) ? "Yes": "No")
    }
}
