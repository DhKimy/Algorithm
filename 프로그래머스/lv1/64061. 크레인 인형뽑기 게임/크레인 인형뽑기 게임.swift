import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var innerBoard = board
    var stack = [Int]()
    var answer = 0
    
    for i in moves {
        for j in 0 ... board.count - 1 {
            if innerBoard[j][i - 1] != 0 {
                if stack.count > 0 && stack.last! == innerBoard[j][i - 1] {
                    answer += 2
                    stack.removeLast()
                    innerBoard[j][i - 1] = 0
                } else {
                    stack.append(innerBoard[j][i - 1])
                    innerBoard[j][i - 1] = 0
                }
                break
            }
        }
    }
    return answer
}