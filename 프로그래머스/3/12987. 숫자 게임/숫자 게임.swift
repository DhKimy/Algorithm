import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let arrA = a.sorted()
    let arrB = b.sorted()

    var idxA = 0
    var idxB = 0
    var answer = 0

    while idxB < b.count {
        if arrA[idxA] < arrB[idxB] {
            answer += 1
            idxA += 1
            idxB += 1
        } else {
            idxB += 1
        }
    }

    return answer
}