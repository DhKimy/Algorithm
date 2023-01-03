import Foundation

func solution(_ ingredient: [Int]) -> Int {
    var stack: [Int] = []
    var answer = 0
    
    for i in ingredient {
        
        stack.append(i)
        
        if stack.count < 4 { continue }
        
        let n = stack.count
        if Array(stack[n - 4 ..< n]) == [1, 2, 3, 1] {
            stack = Array(stack[0 ..< n - 4])
            answer += 1
        }
        
    }
    return answer
}