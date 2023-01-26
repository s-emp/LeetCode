
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func print() -> String {
        if let next = next {
            return "\(val) " + next.print()
        } else {
            return "\(val)"
        }
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard var head = head else { return nil }
        print("Start")
        var lastElement = head, firstElement = head.next
        while firstElement != nil {
            let tmp = firstElement?.next
            firstElement?.next = lastElement
            lastElement = firstElement!
            if tmp != nil {
                firstElement = tmp
            } else {
                return lastElement
            }
        }
        return head
    }
}

let solution = Solution()
print(solution.reverseList(ListNode(1, .init(2, .init(3, .init(4, .init(5))))))?.print())

// 1 2 3 4
// 2 1 3 4
//
