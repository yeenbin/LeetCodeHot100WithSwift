import UIKit

/*
 617. 合并二叉树
 给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。

 你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL 的节点将直接作为新二叉树的节点。

 示例 1:

 输入:
     Tree 1                     Tree 2
           1                         2
          / \                       / \
         3   2                     1   3
        /                           \   \
       5                             4   7
 输出:
 合并后的树:
          3
         / \
        4   5
       / \   \
      5   4   7
 注意: 合并必须从两个树的根节点开始。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-binary-trees
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

/*
 递归终止条件：如果两个树都为空就返回空, 左树为空右树不空返回右树，右数空左数不空返回左树
 利用递归思想，创建一个新节点，根节点为两课树的值相加
 根节点的左树结果为将第一颗树根节点的左树和第二颗树的左树当做两个树重新传入
 同理根节点的右树结果为第一颗树根节点的右树和第二颗树的右树当做两个树重新传入
 递归得出合并后的树

 */
func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    // 1.重叠根
    if (t1 == nil && t2 == nil ){return nil}
    if t1 == nil && t2 != nil{ return t2}
    if t1 != nil && t2 == nil{ return t1}
    
    let newTree: TreeNode = TreeNode(0)
    newTree.val = t1!.val + t2!.val
    
    newTree.left = mergeTrees(t1?.left, t2?.left)
    newTree.right = mergeTrees(t1?.right, t2?.right)
    return newTree
}
