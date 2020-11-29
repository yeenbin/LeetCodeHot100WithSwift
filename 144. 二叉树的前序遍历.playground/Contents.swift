import UIKit

/*
 
 144. 二叉树的前序遍历
 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
 
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


func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    dfs(root, &res)
    return res
}

func dfs(_ root: TreeNode?, _ res: inout [Int]) {
    
    guard let root = root else {
        return
    }
    res.append(root.val)
    dfs(root.left, &res)
    dfs(root.right, &res)
}

