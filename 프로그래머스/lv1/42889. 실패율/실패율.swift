import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var playerCount = [Int](repeating: 0, count: N + 1)
    for i in stages {
        playerCount[i - 1] += 1
    }
    var stagePlayer = stages.count
    var answerBeforeSort = [Double]()
    for i in playerCount {
        answerBeforeSort.append(stagePlayer != 0 ? Double(i) / Double(stagePlayer) : 0)
        stagePlayer -= i
    }
    answerBeforeSort.removeLast()
    var answer = [Int]()
    while answer.count != N {
        let max = answerBeforeSort.max()!
        let index = answerBeforeSort.firstIndex(of: max)!
        answer.append(index + 1)
        answerBeforeSort[index] = -1
    }
    return answer
}