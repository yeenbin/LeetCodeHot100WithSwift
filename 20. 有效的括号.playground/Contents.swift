import UIKit

/*
 20. 有效的括号
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
*/


/*
 guard !str.isEmpty else {
     return true
 }
 */

// 创建一个栈，如果遇到左括号就添加相对应的右括号到新栈里，遇到右括号就从栈中pop出栈顶进行对比，如果不相等就返回false，如果for循环都通过，最终返回栈顶是否为空，如果栈是空的说明字符串为有效的字符串
func isValid(_ str: String) -> Bool {
    
    var stack = [Character]()
    for char in str {
        if char == "(" {
            stack.append(")")
        }else if char == "{" {
            stack.append("}")
        }else if char == "[" {
            stack.append("]")
        }else {
            guard char == stack.popLast() else {
                return false
            }
        }
    }
    
    return stack.isEmpty
}

isValid("{[]}")
