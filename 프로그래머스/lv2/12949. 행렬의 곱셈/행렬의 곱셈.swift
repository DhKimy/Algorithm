import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer: [[Int]] = []
    var array = [Int]()
    for i in arr1 {
        var sum = 0
        for j in 0 ... arr2[0].count - 1 {
            for k in 0 ... arr2.count - 1 {
                sum += i[k] * arr2[k][j]
            }
            array.append(sum)
            sum = 0
        }
        answer.append(array)
        array = [Int]()
    }
    return answer
}