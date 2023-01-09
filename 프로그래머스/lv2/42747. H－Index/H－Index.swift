import Foundation

func solution(_ citations:[Int]) -> Int {
    // 계수 정렬
    var array = [Int](repeating: 0, count: citations.max()! + 1)
    for i in citations {
        array[i] += 1
    }
    var tempSum = 0
    for i in stride(from: array.count - 1, to: 0, by: -1) {
        tempSum += array[i]
        if tempSum >= i {
            return i
        }
    }
    return 0
}