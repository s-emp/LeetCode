class SortColors {
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        let lastIndex = nums.count - 1
        var red = 0
        var blue = lastIndex
        var index = 0
        while index <= lastIndex - (lastIndex - blue) {
            switch nums[index] {
            case 0:
                if index == red {
                    index += 1
                    red += 1
                } else {
                    nums.swapAt(index, red)
                    red += 1
                }
            case 1:
                index += 1
            case 2:
                if index >= blue {
                    index += 1
                    blue -= 1
                } else {
                    nums.swapAt(index, blue)
                    blue -= 1
                }
            default: index += 1
            }
        }
    }
    
    static func tests() {
        print("Start tests SortColors")
        let v = SortColors()
        var nums = [2,0,2,1,1,0]
        v.sortColors(&nums)
        print(nums)
        print(nums == [0,0,1,1,2,2])
        nums = [2,0,1]
        v.sortColors(&nums)
        print(nums == [0,1,2])
        nums = [0, 0]
        v.sortColors(&nums)
        print(nums == [0,0])
        nums = [1,2,1]
        v.sortColors(&nums)
        print(nums == [1,1,2])
        
        print("End tests SortColors")
    }
}
