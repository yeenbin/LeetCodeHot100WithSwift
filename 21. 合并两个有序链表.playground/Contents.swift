import UIKit

/*
 21. 合并两个有序链表
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

  

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
          self.next = nil
      }
}

// 解题思路：使用递归法
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    
    if l1!.val < l2!.val {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    }else {
        l2?.next = mergeTwoLists(l1, l2?.next)
        return l2
    }
}


