import UIKit

/*
 283. 移动零
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:

 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/move-zeroes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func moveZeroes(_ nums: inout [Int]) {
    var lastNoneZeroIndex = 0
    for i in 0..<nums.count {
        // 如果遇到不为0的数就执行与lastNoneZeroIndex的数进行交换并且index +=1
        if nums[i] != 0 {
            nums.swapAt(i, lastNoneZeroIndex)
            lastNoneZeroIndex += 1
        }
    }
}

var nums = [0,0,1]
moveZeroes(&nums)





