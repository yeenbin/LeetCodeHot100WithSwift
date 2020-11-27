import UIKit

/*448. 找到所有数组中消失的数字
 
 给定一个范围在  1 ≤ a[i] ≤ n ( n = 数组大小 ) 的 整型数组，数组中的元素一些出现了两次，另一些只出现一次。
 
 找到所有在 [1, n] 范围之间没有出现在数组中的数字。
 
 您能在不使用额外空间且时间复杂度为O(n)的情况下完成这个任务吗? 你可以假定返回的数组不算在额外空间内。
 
 示例:
 
 输入:
 [4,3,2,7,8,2,3,1]
 
 输出:
 [5,6]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-all-numbers-disappeared-in-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    
    var res = [Int]()
    
    if nums.isEmpty {
        return res
    }
    
    //初始化数组
    for i in 1...nums.count {
        res.append(i)
    }
    
    for num in nums {
        // 把出现的值对应的索引-1的位置替换为0，最后剔除0再返回
        if num == res[num - 1] {
            res[num - 1] = 0
        }
    }
    
    return res.filter{ $0 > 0 }
    
}

var nums = [4,3,2,7,8,2,3,1]

findDisappearedNumbers(nums)













