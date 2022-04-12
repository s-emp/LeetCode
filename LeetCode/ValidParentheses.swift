//
//  ValidParentheses.swift
//  LeetCodeV2
//
//  Created by Сергей Мельников on 12.04.2022.
//

class ValidParentheses {
    // memory: O(n) speed: O(n)
    func isValid(_ s: String) -> Bool {
        let dic: [String.Element: String.Element] = [")": "(", "]": "[", "}": "{"]
        var stack: [String.Element] = []
        for character in s {
            if dic[character] != nil {
                guard let last = stack.popLast(), dic[character] == last else {
                    return false
                }
            } else {
                stack.append(character)
            }
        }
        return stack.isEmpty
    }
    
    static func tests() {
        print("Start tests ValidParentheses")
        let v = ValidParentheses()
        print(v.isValid("()") ? "Yes" : "No")
        print(v.isValid("()[]{}") ? "Yes" : "No")
        print(v.isValid("()[]{") == false ? "Yes" : "No")
        print(v.isValid("(]") == false ? "Yes" : "No")
        print("End tests ValidParentheses")
    }
}
