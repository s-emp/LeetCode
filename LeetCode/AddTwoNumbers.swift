
public class ListNode: CustomStringConvertible {
    public var description: String {
        if let next = next {
            return "\(val)\(next.description)"
        } else {
            return "\(val)"
        }
    }
    
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class AddTwoNumbers {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var additionalVal = 0
        let result = ListNode()
        var last: ListNode? = nil
        var first = result
        repeat {
            let new = ListNode()
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + additionalVal
            first.val = sum % 10
            first.next = new
            last = first
            first = new
            additionalVal = sum / 10
            l1 = l1?.next
            l2 = l2?.next
        } while l1 != nil || l2 != nil || additionalVal != 0
        last?.next = nil
        return result
    }
    
    func tests() {
        print("Start test AddTwoNumbers")
        var l1 = ListNode(2, .init(4, .init(3)))
        var l2 = ListNode(5, .init(6, .init(4)))
        print(addTwoNumbers(l1, l2)!.description == "708" ? "Yes" : "No [708] result: \(addTwoNumbers(l1, l2)!.description)")
        l1 = ListNode(0)
        l2 = ListNode(1)
        print(addTwoNumbers(l1, l2)!.description == "1" ? "Yes" : "No [1] result: \(addTwoNumbers(l1, l2)!.description)")
        l1 = ListNode(8, .init(3, .init(2)))
        l2 = ListNode(9, .init(2, .init(1)))
        print(addTwoNumbers(l1, l2)!.description == "763" ? "Yes" : "No [763] result: \(addTwoNumbers(l1, l2)!.description)")
        print("Finish test AddTwoNumbers")
    }
}


