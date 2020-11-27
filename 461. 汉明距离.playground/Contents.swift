import UIKit

/*
 461. 汉明距离

 两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。

 给出两个整数 x 和 y，计算它们之间的汉明距离。

 注意：
 0 ≤ x, y < 231.

 示例:

 输入: x = 1, y = 4

 输出: 2

 解释:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ↑   ↑

 上面的箭头指出了对应二进制位不同的位置。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/hamming-distance
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 先将x和y进行^的操作，结果中有1就代表两则不同的位置
//  迭代+ 右移一位操作，计算出1的个数

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var z = x^y
    var count = 0
    while z > 0 {
        count += z & 1
        // 右移1位操作，直到为0退出循环
        z = z >> 1
    }
    return count
}


