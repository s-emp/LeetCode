//
//  MergeTwoSortedLists.swift
//  LeetCodeV2
//
//  Created by Сергей Мельников on 13.04.2022.
//

class MergeTwoSortedLists {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil || list2 != nil else { return nil }
        var list1 = list1
        var list2 = list2
        let result = ListNode()
        var lastList: ListNode?
        var currentList = result
        while list1 != nil || list2 != nil {
            if list1 == nil {
                currentList.val = list2!.val
                list2 = list2?.next
            } else if list2 == nil {
                currentList.val = list1!.val
                list1 = list1?.next
            } else if list1!.val > list2!.val {
                currentList.val = list2!.val
                list2 = list2?.next
            } else {
                currentList.val = list1!.val
                list1 = list1?.next
            }
            currentList.next = ListNode()
            lastList = currentList
            currentList = currentList.next!
        }
        lastList?.next = nil
        return result
    }
    
    static func tests() {
        print("Start tests MergeTwoSortedLists")
        let v = MergeTwoSortedLists()
        print(v.mergeTwoLists(.init(1, .init(2, .init(4))), .init(1, .init(3, .init(4))))?.description == "112344" ? "Yes" : "No")
        print(v.mergeTwoLists(nil, nil) == nil ? "Yes" : "No")
        print(v.mergeTwoLists(.init(1), nil)?.description == "1" ? "Yes" : "No")
        print(v.mergeTwoLists(.init(1), .init(1, .init(1)))?.description == "111" ? "Yes" : "No")
        print("End tests MergeTwoSortedLists")
    }
}
