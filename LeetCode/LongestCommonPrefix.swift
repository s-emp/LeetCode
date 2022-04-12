//
//  LongestCommonPrefix.swift
//  LeetCodeV2
//
//  Created by Сергей Мельников on 12.04.2022.


class LongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String { // O(n + l)
        var result = ""
        guard strs.count > 0 && !strs[0].isEmpty else { return result }
        var currentOffset = 0
        while true {
            var currentCharacter: Character? = nil
            for str in strs {
                guard str.count > currentOffset else { return result }
                let cha = str[str.index(str.startIndex, offsetBy: currentOffset)]
                if currentCharacter == nil {
                    currentCharacter = cha
                } else if currentCharacter! != cha {
                    return result
                }
            }
            currentOffset += 1
            result.append(currentCharacter!)
        }
        return result
    }
    
    func longestCommonPrefixCommon(_ strs: [String]) -> String { // O(n * k)
        if (strs.isEmpty) {return ""}
        var prefix = strs[0]
        for str in strs {
            while prefix.count > 0 {
                if (!str.hasPrefix(prefix)) {
                    prefix.removeLast()
                } else {
                    break
                }
            }
        }
        return prefix
    }
    
    static func tests() {
        let v = LongestCommonPrefix()
        print("Start tests LongestCommonPrefix")
        print(v.longestCommonPrefix(["flower","flow","flight"]) == "fl" ? "Yes": "No")
        print(v.longestCommonPrefix(["dog","racecar","rar"]) == "" ? "Yes": "No")
        print(v.longestCommonPrefix(["dog","racecar",""]) == "" ? "Yes": "No")
        print("End tests LongestCommonPrefix")
    }
}
