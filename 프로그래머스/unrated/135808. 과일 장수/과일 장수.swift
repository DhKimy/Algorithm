import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let sortedScore = score.sorted(by: >)
    var answer = 0
    var tempArray = [Int]()
    for i in 0 ... sortedScore.count - 1 {
        tempArray.append(sortedScore[i])
        if i % m == m - 1 {
            answer += tempArray.min()! * m
            tempArray = [Int]()
        }
    }
    return answer
}