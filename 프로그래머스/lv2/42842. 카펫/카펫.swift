import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sum = brown + yellow
    var x = 1
    var y = 1
    for i in 1 ... sum {
        if sum % i == 0 {
            x = sum / i
            y = i
        }
        if (x - 2) * (y - 2) == yellow {
            break
        }
    }
    return [x, y]
}