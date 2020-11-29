import UIKit

/*
 
 338. 比特位计数
 
 给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。
 
 给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。

 示例 1:

 输入: 2
 输出: [0,1,1]
 示例 2:

 输入: 5
 输出: [0,1,1,2,1,2]
 进阶:

 给出时间复杂度为O(n*sizeof(integer))的解答非常容易。但你可以在线性时间O(n)内用一趟扫描做到吗？
 要求算法的空间复杂度为O(n)。
 你能进一步完善解法吗？要求在C++或任何其他语言中不使用任何内置函数（如 C++ 中的 __builtin_popcount）来执行此操作。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/counting-bits
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 解题思路，先利用题191. 位1的个数 求出每个数二进制1的位数，在一次遍历循环就组装就可以了
func countBits(_ num: Int) -> [Int] {
    func hamingWeight(_ num: Int) -> Int {
        var count = 0
        var num = num
        while num != 0 {
            num = num & (num - 1)
            count += 1
        }
        return count
    }
    
    var res = [Int]()
    for i in 0...num {
        res.append(hamingWeight(i))
    }
    return res
}

