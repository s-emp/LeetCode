//
//  Yandex.swift
//  LeetCodeV2
//
//  Created by Сергей Мельников on 17.04.2022.
//

class Yandex {
    func ya(_ mat: [[Int]]) -> [Int] {
        guard !mat.isEmpty else { return [] }
        let edge = mat.count
        
        let center = mat.count / 2
        let deep = center
        let first = mat[center][center]
        var result = [first]
        for i in 1...deep {
            result.append(contentsOf: o(first, edge, i))
        }
        return result
    }
    
    func o(_ start: Int, _ edge: Int, _ deep: Int) -> [Int] {
        var currentValue = start - edge * deep
        var result = [currentValue]
        for _ in 0..<deep {
            currentValue += 1
            result.append(currentValue)
        }
        for _ in 0..<deep * 2 {
            currentValue += edge
            result.append(currentValue)
        }
        for _ in 0..<deep * 2 {
            currentValue -= 1
            result.append(currentValue)
        }
        for _ in 0..<deep * 2 {
            currentValue -= edge
            result.append(currentValue)
        }
        for _ in 0..<deep - 1 {
            currentValue += 1
            result.append(currentValue)
        }
        return result
    }
    
    static func tests() {
        print("Start tests Yandex")
        let v = Yandex()
        print(v.ya([
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]) == [5,2,3,6,9,8,7,4,1])
        let mat = [
            [1 ,2 ,3, 4, 5],
            [6 ,7 ,8, 9, 10],
            [11,12,13,14,15],
            [16,17,18,19,20],
            [21,22,23,24,25]
        ]
        let result = [13, 8, 9, 14, 19, 18, 17, 12, 7, 3, 4,5, 10, 15, 20, 25, 24, 23, 22, 21,16, 11, 6, 1, 2]
        print(v.ya(mat) == result)
        let mat3 = [
            [ 1, 2, 3, 4, 5, 6, 7],
            [ 8, 9,10,11,12,13,14],
            [15,16,17,18,19,20,21],
            [22,23,24,25,26,27,28],
            [29,30,31,32,33,34,35],
            [36,37,38,39,40,41,42],
            [43,44,45,46,47,48,49]
        ]
        let result3 = [25,18,19,26,33,32,31,24,17,11,12,13,20,27,34,41,40,39,38,37,30,23,16,9,10,4,5,6,7,14,21,28,35,42,49,48,47,46,45,44,43,36,29,22,15,8,1,2,3]
        print(v.ya(mat3) == result3)
        print("End tests Yandex")
    }
}
