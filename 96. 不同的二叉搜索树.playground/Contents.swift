import UIKit

/*
 
 96. 不同的二叉搜索树
 给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？

 示例:

 输入: 3
 输出: 5
 解释:
 给定 n = 3, 一共有 5 种不同结构的二叉搜索树:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-binary-search-trees
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
  本题解题思路用到动态规划
  给定一个有序序列1...n, 为了构建出一颗二叉搜索树，我们可以遍历每个数字i，将数字作为树根，将1...(i - 1)，将
 （i+1）...n 序列作为右子树。接着我们可以按照同样的方式，由于根的值不同，因此可以保证每颗二叉树都是唯一，原问题可以分解成规模较小的两个子问题，并且子问题的解可以复用。因此，我们可以使用动态规划来求解本题。
  定义两个函数
 1. G（n）：长度为n的序列能构成的不同二叉搜索树的个数
 2. F（i，n）以i为根、序列长度为n的不同二叉搜索树个数（1<=i<=n）
 G(n) 就是我们要求的解
 当序列长度为1（只有根）或者为0 （空树）时，只有一种情况
 给定序列1...n，我们选择数字i作为根，则根为i的所有二叉搜索树的集合是左子树集合和右子树集合的笛卡
 尔积。
 举个例子：
 创建以3为根，长度为7的不同搜索二叉树，这个序列为【1，2，3，4，5，6，7】，我们需要从左子序列【1，2】构建左子树，左子树的数量为G（2），从【4，5，6，7】构建不同的右子树集合数量为G（4），于是F（3，7） = G（2）* G（4）
 于是我们得出 F（i，n） = G（i - 1）* G（n - i）
 
          n
 G(n)=    ∑   F(i,n)
          i=1
 ​    
 */
func numTrees(_ n: Int) -> Int {
    if n == 1 {return 1}
    if n == 2 {return 2}
    var G: [Int] = Array(repeating: 0, count: n + 1)
    G[0] = 1
    G[1] = 1
    for i in 2...n {
        for j in 1...i {
            G[i] += G[j - 1] * G[i - j]
        }
    }
    return G[n]
}

