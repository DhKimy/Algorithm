import Foundation

func solution(_ s:String) -> Int{
    let arrayS = Array(s)
    var stack = [Character]()
    for i in arrayS {
        if stack.last ?? "0" == i {
            stack.removeLast()
            continue
        }
        stack.append(i)
    }
    return stack.count == 0 ? 1 : 0
}