import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var innerA = A.sorted()
    var innerB = B.sorted(by: >)
    
    var j = 0
    for i in innerA {
        innerA[j] = i * innerB[j]
        j += 1
    }
    return innerA.reduce(0, +)
}