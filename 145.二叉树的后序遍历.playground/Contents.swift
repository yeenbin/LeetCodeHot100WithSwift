
import UIKit

/*
 
 94. 二叉树的后续遍历
 给定一个二叉树的根节点 root ，返回它的 中序 遍历。
 中序： 左子树 右子树  根节点
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


func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    dfs(root, &res)
    return res
}

func dfs(_ root: TreeNode?, _ res: inout [Int]) {
    
    guard let root = root else {
        return
    }
    dfs(root.left, &res)
    dfs(root.right, &res)
    res.append(root.val)
}
