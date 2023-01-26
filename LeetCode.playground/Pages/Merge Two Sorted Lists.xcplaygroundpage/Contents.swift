
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard var list1 = list1, var list2 = list2 else { return nil }
        let result = ListNode()
        var current = result
        while true {
            if list1.val < list2.val {
                current.val = list1.val
                if let next = list1.next {
                    list1 = next
                    current.next = ListNode()
                    current = current.next!
                    continue
                } else {
                    current.next = list2
                    return result
                }
            } else {
                current.val = list2.val
                if let next = list2.next {
                    list2 = next
                    current.next = ListNode()
                    current = current.next!
                    continue
                } else {
                    current.next = list1
                    return result
                }
            }
        }
        return result
    }
}
