import UIKit

/*
 136. 只出现一次的数字
 
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

 说明：

 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

 示例 1:

 输入: [2,2,1]
 输出: 1
 示例 2:

 输入: [4,1,2,1,2]
 输出: 4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/single-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 第一想法
func singleNumber(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for num in nums {
        if set.contains(num) {
            set.remove(num)
        }else {
            set.insert(num)
        }
    }
    return set.first!
}


// 异或解法
/*
 
 //  第一反应用map
        //  考虑到不适用额外空间，用异或
        //  a ^ 0 = a
        //  a ^ a = 0
        //  a ^ b ^ a = a ^ a ^ b = 0 ^ b = b

作者：15701182581
链接：https://leetcode-cn.com/problems/single-number/solution/yi-huo-92-ms-zai-suo-you-swift-ti-jiao-zhong-ji-ba/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/

func singleNumber2(_ nums: [Int]) -> Int {
    var res: Int = 0
    for num in nums {
        res = num ^ res
    }
    return res
}
