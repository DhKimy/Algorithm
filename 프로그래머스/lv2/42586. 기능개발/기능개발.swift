import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var i = 0
    let progressingDay: [Int] = progresses.map({ key in
        if (100 - key) % speeds[i] == 0 {
            let temp = (100 - key) / speeds[i]
            i += 1
            return temp
        } else {
            let temp = (100 - key) / speeds[i] + 1
            i += 1
            return temp
        }
    })
    var answer = [Int]()
    var stack = [Int]()
    for i in progressingDay {
        if stack.isEmpty {
            stack.append(i)
        } else {
            if stack[0] >= i {
                stack.append(i)
            } else {
                answer.append(stack.count)
                stack = [Int]()
                stack.append(i)
            }
        }
    }
    answer.append(stack.count)
    return answer
}