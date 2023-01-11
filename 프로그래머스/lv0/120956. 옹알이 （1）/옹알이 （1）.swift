import Foundation

func solution(_ babbling:[String]) -> Int {
    let pronunciation = ["aya", "ye", "woo", "ma"]
    var answer = 0
    var tempBabbling = babbling
    
    for i in 0 ... tempBabbling.count - 1 {
        for k in pronunciation {
            tempBabbling[i] = tempBabbling[i].replacingOccurrences(of: k, with: "1")
        }
        if Int(tempBabbling[i]) != nil {
            answer += 1
        }
    }
    return answer
}