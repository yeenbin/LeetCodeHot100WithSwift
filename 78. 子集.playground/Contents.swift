import UIKit


/*
 
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 
 说明：解集不能包含重复的子集。
 
 示例:
 
 输入: nums = [1,2,3]
 输出:
 [
 [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/subsets
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


// 迭代
func subsets(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    // 空集一定是子集
    res.append([Int]())
    
    for num in nums {
        var list = [[Int]]()
        for item in res {
            list.append(item + [num])
            print(list)
        }
        res.append(contentsOf: list)
        print("res = \(res)")
    }
    return res
}


let nums = [1,2,3]
//subsets(nums)


// 解法二: dfs

func subsets2(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    
    func dfs(a: [Int], s: Int) {
        res.append(a)
        guard s < nums.endIndex else {
            return
        }
        for i in nums.indices[s...] {
            print(i,a,nums[i...i])
            dfs(a: a + nums[i...i], s: i + 1)
        }
    }
    
    dfs(a: [], s: 0)

    return res
}


subsets2(nums)





