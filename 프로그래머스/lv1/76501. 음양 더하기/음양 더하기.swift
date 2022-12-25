import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum = 0
    for i in 0 ... absolutes.count - 1 {
        if signs[i] {
            sum += absolutes[i]
        } else {
            sum -= absolutes[i]
        }
    }
    return sum
}