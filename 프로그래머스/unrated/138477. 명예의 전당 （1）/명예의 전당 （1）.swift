import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var honorList = [Int]()
    var answer = [Int]()
    for i in 0 ... score.count - 1 {
        if i <= k - 1 {
            honorList.append(score[i])
            honorList.sort(by: >)
            answer.append(honorList[honorList.count - 1])
        } else {
            if honorList[k - 1] >= score[i] {
                answer.append(honorList[k - 1])
            } else {
                honorList[k - 1] = score[i]
                honorList.sort(by: >)
                answer.append(honorList[k - 1])
            }
        }
    }
    
    return answer
}