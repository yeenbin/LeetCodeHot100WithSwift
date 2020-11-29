import UIKit

/*
 
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutations
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


// 回溯法
func permute(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    var temp = [Int]()
    backtrack(&res, &temp, nums, 0)
    return res
}

func backtrack(_ res: inout [[Int]], _ temp: inout [Int], _ nums: [Int], _ start: Int) {
    
    if temp.count == nums.count {
        res.append(temp)
    }else {
        for i in 0..<nums.count {
            if temp.contains(nums[i]) { continue } // 如果存在就跳过
            temp.append(nums[i])
            backtrack(&res, &temp, nums, i + 1)
            temp.remove(at: temp.count - 1)
        }
    }
    
}


var nums = [1,2,3,4]
print(permute(nums))
