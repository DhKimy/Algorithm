import Foundation

func solution(_ n:Int) -> [[Int]] {
    var answer: [[Int]] = []
    func hanoi(_ num: Int, _ from: Int, _ to: Int, _ other: Int) {
        if num == 0 { return }
        hanoi(num - 1, from, other, to)
        answer.append([from, to])
        hanoi(num - 1, other, to, from)
    }
    hanoi(n, 1, 3, 2)
    return answer
}