import UIKit

class ListNode {
    var val: Int?
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// 利用快慢指针，让快指针先走K，然后慢指针再走，直到fast指针为空返回slow
func lastNNode(_ list: ListNode?, _ k: Int) -> ListNode? {
    
    var slow = list
    var fast = list
    var count = 0
    while fast != nil {
        fast = fast?.next
        if count >= k {
            slow = slow?.next
        }
        count += 1
    }
    
    return slow
}
