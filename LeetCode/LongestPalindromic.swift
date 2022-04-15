//
//  LongestPalindromic.swift
//  LeetCodeV2
//
//  Created by Сергей Мельников on 14.04.2022.
//


class LongestPalindromic {
    
    func isPalindrome(_ str: String) -> Bool {
        guard str.count > 0 else { return true }
        var offset = 0
        while offset < str.count / 2 {
            let lValue = str[str.index(str.startIndex, offsetBy: offset)]
            let rValue = str[str.index(str.endIndex, offsetBy: -offset - 1)]
            if lValue != rValue {
                return false
            }
            offset += 1
        }
        return true
    }
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return s }
        var dic: [String.Element: [Int]] = [:]
        for (i, c) in s.enumerated() {
            if dic[c] != nil {
                dic[c]?.append(i)
            } else {
                dic[c] = [i]
            }
        }
        var result = ""
        for (key, values) in dic where values.count > 1 {
            for (indexInMass, indexInString) in values.enumerated() {
                var lastIndexInMass = values.count - 1
                var isContinue = true
                while indexInMass < lastIndexInMass {
                    let lastIndexInString = values[lastIndexInMass]
                    if lastIndexInString - indexInString < result.count {
//                        isContinue = false
                        break
                    }
                    let range = s.index(s.startIndex, offsetBy: indexInString)...s.index(s.startIndex, offsetBy: lastIndexInString)
                    let sub = String(s[range])
                    if isPalindrome(sub) {
                        result = sub
                        break
                    }
                    lastIndexInMass -= 1
                }
                if !isContinue { break }
            }
        }
        
        return result.isEmpty ? String(dic.first!.key) : result
    }
    
    static func tests() {
        print("Start tests LongestPalindromic")
        let v = LongestPalindromic()
        print(v.longestPalindrome("babad")  == "bab" || v.longestPalindrome("babad") == "aba" ? "Yes" : "No")
        print(v.longestPalindrome("cbbd") == "bb" ? "Yes" : "No")
        print(v.longestPalindrome("") == "" ? "Yes" : "No")
        print(v.longestPalindrome("bbb") == "bbb" ? "Yes" : "No")
        print(v.longestPalindrome("b") == "b" ? "Yes" : "No")
        print(v.longestPalindrome("ab") == "a" || v.longestPalindrome("ab") == "b" ? "Yes" : "No")
        print(v.longestPalindrome("abcacba") == "abcacba" ? "Yes" : "No")
        print(v.longestPalindrome("aacabdkacaa") == "aca")
        print("End tests LongestPalindromic")
    }
}
