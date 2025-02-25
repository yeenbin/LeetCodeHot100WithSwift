import UIKit

/*
 206. 反转链表
 反转一个单链表。
 
 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list
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

func reverseList(_ head: ListNode?) -> ListNode? {
    // 双指针
    var newNode:ListNode? = nil
    var p = head // 移动指针
    while p != nil {
        let temp = p!.next
        p?.next = newNode
        newNode = p
        p = temp
    }
    return newNode
}


// 使用递归
func reverseList2(_ head: ListNode?) -> ListNode? {
    if head == nil || head!.next == nil {
        return head
    }
    var ret: ListNode? = reverseList2(head?.next)
    head?.next?.next = head
    head?.next = nil
    return ret
}
