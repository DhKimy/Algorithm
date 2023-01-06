import Foundation

func solution(_ s:String) -> Int{
    let arrayS = Array(s)
    var stack = [Character]()
    for i in arrayS {
        stack.append(i)
        let temp = stack.count
        if temp >= 2 && stack[temp - 1] == stack[temp - 2] {
            stack.removeLast()
            stack.removeLast()
        }
    }
    return stack.count == 0 ? 1 : 0
}