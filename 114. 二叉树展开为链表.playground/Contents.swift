import UIKit

/*
 114. 二叉树展开为链表
 
 给定一个二叉树，原地将它展开为一个单链表。

  

 例如，给定二叉树

     1
    / \
   2   5
  / \   \
 3   4   6
 将其展开为：

 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// 递归+ 迭代拼接
func flatten(_ root: TreeNode?) {
    guard var root = root else {
        return
    }
    // 将左子树展开为单链表
    flatten(root.left)
    // 将右子树展开为单链表
    flatten(root.right)
    
    // 暂存右子树
    let temp: TreeNode? = root.right
    // 左子树接到根的右侧
    root.right = root.left
    // 左子树置空
    root.left = nil
    // 再接上右子树
    while root.right != nil {
        root = root.right!
    }
    
    root.right = temp
}


// 解法二

private var prev: TreeNode? = nil

func flatten2(_ root: TreeNode?) {
    guard let root = root else {
        return
    }
    
    // 将右子树展开为单链表
    flatten(root.right)
    
    // 将左子树展开为单链表
    flatten(root.left)
    
    root.right = prev
    root.left = nil
    prev = root
}
