import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var answer = 0
    var countDict = [Int:Int]()
    for i in tangerine.min()! ... tangerine.max()! {
        countDict[i] = 0
    }
    for i in tangerine {
        countDict[i]! += 1
    }
    var j = k
    for i in countDict.sorted(by: {$0.value > $1.value}) {
        j -= i.value
        answer += 1
        if j <= 0 {
            break
        }
    }
    return answer
}