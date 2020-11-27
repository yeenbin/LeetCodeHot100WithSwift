import UIKit

/*
 121. 买卖股票的最佳时机
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

 如果你最多只允许完成一笔交易（即买入和卖出一支股票一次），设计一个算法来计算你所能获取的最大利润。

 注意：你不能在买入股票前卖出股票。

  

 示例 1:

 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 示例 2:

 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

//
func maxProfit(_ prices: [Int]) -> Int {
    var maxCur = 0, maxsofar = 0
    for i in 1..<prices.count {
        // 从第二天开始算起
        maxCur += prices[i] - prices[i - 1]
        // 如果小于0就置为0
        maxCur = max(0, maxCur)
        maxsofar = max(maxCur, maxsofar)
    }
    return maxsofar
}

var prices = [0,6,-3,7]
maxProfit(prices)


func maxProfit2(_ prices: [Int]) -> Int {
       var minPrice = Int.max, maxProfit = 0
       for i in 0..<prices.count {
           if prices[i] < minPrice {
               minPrice = prices[i]
           } else if prices[i] - minPrice > maxProfit {
               maxProfit = prices[i] - minPrice
           }
       }
       
       return maxProfit
    
}

maxProfit2(prices)


