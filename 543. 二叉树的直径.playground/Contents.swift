import UIKit

/*
 543. 二叉树的直径
 
 给定一棵二叉树，你需要计算它的直径长度。一棵二叉树的直径长度是任意两个结点路径长度中的最大值。这条路径可能穿过也可能不穿过根结点。

  

 示例 :
 给定二叉树

           1
          / \
         2   3
        / \
       4   5
 返回 3, 它的长度是路径 [4,2,1,3] 或者 [5,2,1,3]。

  

 注意：两结点之间的路径长度是以它们之间边的数目表示。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/diameter-of-binary-tree
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

// 最长路径为左子树的最大深度+右子树的最长深度

var maxCount = 0
func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    maxDepth(root)
    return maxCount
}

// 求最大深度
func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    let left: Int = maxDepth(root.left)
    let right: Int = maxDepth(root.right)
    
    maxCount = max(maxCount, left + right)
    print(maxCount)
    return  max(left, right) + 1
}



