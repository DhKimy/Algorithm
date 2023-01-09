import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = 0
    var distance = n
    while distance != 0 {
        if distance % 2 == 0 {
            distance /= 2
        } else {
            distance -= 1
            answer += 1
        }
    }
    return answer
}