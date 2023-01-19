import Foundation

func solution(_ elements:[Int]) -> Int {
    var answer = Set<Int>()
    for i in 0 ... elements.count - 1 {
        var number = 0
        for j in 0 ... elements.count - 1 {
            let index = (i + j) % elements.count
            number += elements[index]
            answer.insert(number)
        }
    }
    return answer.count
}