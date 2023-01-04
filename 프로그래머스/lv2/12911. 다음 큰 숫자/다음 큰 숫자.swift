import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = 0
    var binaryNumber = String(n, radix: 2).filter({ $0 == "1" }).count
    var tempNumber = n + 1
    while true {
        if String(tempNumber, radix: 2).filter({ $0 == "1"}).count == binaryNumber {
            answer = tempNumber
            break
        }
        tempNumber += 1
    }
    
    return answer
}