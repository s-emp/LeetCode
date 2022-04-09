//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCodeV2
//
//  Created by Сергей Мельников on 09.04.2022.
//

class LongestSubstring {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var bottomOffset = 0
        var length = 0
        var dic: [String.Element: Int] = [:]
        var offset = 0
        for character in s {
            guard let searchIndex = dic[character], bottomOffset <= searchIndex else {
                dic[character] = offset
                offset += 1
                continue
            }
            length = length < offset - bottomOffset ? offset - bottomOffset : length
            bottomOffset = searchIndex + 1
            dic[character] = offset
            offset += 1
        }
        let currentLength = offset - bottomOffset
        return length < currentLength ? currentLength : length
    }
    
    static func tests() {
        print("Start tests LongestSubstring")
        let v = LongestSubstring()
        print(v.lengthOfLongestSubstring("abcabcbb") == 3 ? "Yes": "No")
        print(v.lengthOfLongestSubstring("bbbbb") == 1 ? "Yes": "No")
        print(v.lengthOfLongestSubstring("pwwkew") == 3 ? "Yes": "No")
        print(v.lengthOfLongestSubstring("aab") == 2 ? "Yes": "No")
        print(v.lengthOfLongestSubstring("a") == 1 ? "Yes": "No")
        print(v.lengthOfLongestSubstring("tmmzuxt") == 5 ? "Yes": "No")
        print(v.lengthOfLongestSubstring("aabaab!bb") == 3 ? "Yes": "No")
        print("End tests LongestSubstring")
    }
}
