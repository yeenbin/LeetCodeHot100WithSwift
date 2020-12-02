import UIKit

/*
 101. 对称二叉树
 
 给定一个二叉树，检查它是否是镜像对称的。

  

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
  

 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/symmetric-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 进阶：

 你可以运用递归和迭代两种方法解决这个问题吗？
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


// 解法一： 递归解法
func isSymmetric(_ root: TreeNode?) -> Bool {
    return dfs(root?.left, root?.right)
}

func dfs(_ left: TreeNode?, _ right: TreeNode?) ->Bool {
    if left == nil && right == nil {
        return true
    }
    if left?.val != right?.val {
        return false
    }
    
    return dfs(left?.left, right?.right) && dfs(left?.right, right?.left)
}


// 解法二，迭代解法 用栈来解决

func isSymmetric2(_ root: TreeNode?) -> Bool {
    if root == nil{ return true }
    var stack = [TreeNode?]()
    stack.append(root?.left)
    stack.append(root?.right)
    while !stack.isEmpty {
        let n1 = stack.removeLast(), n2 = stack.removeLast()
        if n1 == nil && n2 == nil { continue }
        if n1 == nil || n2 == nil || n1?.val != n2?.val {
            return false
        }
        stack.append(n1?.left)
        stack.append(n2?.right)
        stack.append(n1?.right)
        stack.append(n2?.left)
    }
    return true
}
