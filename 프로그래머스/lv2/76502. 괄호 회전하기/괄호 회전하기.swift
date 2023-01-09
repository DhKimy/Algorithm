import Foundation

func solution(_ s:String) -> Int {
    let leftBracket: [Character] = ["[", "(", "{"]
    let rightBracket: [Character] = ["]", ")", "}"]
    var answer = 0
    
    var innerS = Array(s)
    for i in 0 ... s.count - 1{
        // 왼쪽으로 1회전.
        if i != 0 {
            let temp = innerS.first!
            innerS.removeFirst()
            innerS.append(temp)
        }
        var stack = [Character]()
        for (index, j) in innerS.enumerated() {
            if stack.count >= 1 && leftBracket.contains(stack.last!) && rightBracket.contains(j) {
                if leftBracket.firstIndex(of: stack.last!) == rightBracket.firstIndex(of: j) {
                    stack.removeLast()
                } else {
                    stack.append(j)
                }
            } else {
                stack.append(j)
            }
            if index == innerS.count - 1 && stack.count == 0 {
                answer += 1
            }
        }
    }
    return answer
}