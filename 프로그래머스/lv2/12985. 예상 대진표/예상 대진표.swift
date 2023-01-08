import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 0
    var innerA = a > b ? a : b
    var innerB = a > b ? b : a
    
    while true {
        answer += 1
        if innerA % 2 == 0 && innerA - innerB == 1 {
            break
        }
        innerA = (innerA % 2 == 0) ? innerA / 2 : (innerA / 2) + 1
        innerB = (innerB % 2 == 0) ? innerB / 2 : (innerB / 2) + 1
    }
    return answer
}