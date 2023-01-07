import Foundation

func solution(_ babbling:[String]) -> Int {
    var innerBabbling = babbling
    var answer = 0
    for i in 0 ... innerBabbling.count - 1 {
        innerBabbling[i] = innerBabbling[i].replacingOccurrences(of: "aya", with: "1")
        innerBabbling[i] = innerBabbling[i].replacingOccurrences(of: "ye", with: "2")
        innerBabbling[i] = innerBabbling[i].replacingOccurrences(of: "woo", with: "3")
        innerBabbling[i] = innerBabbling[i].replacingOccurrences(of: "ma", with: "4")
    }
    innerBabbling = innerBabbling.map({
        if Int($0) != nil {
            return $0
        }
        return ""
    }).filter({ $0 != "" })
    
    if innerBabbling.count == 0 {
        return 0
    }
    
    for i in 0 ... innerBabbling.count - 1 {
        // 중복 검사
        for (index, j) in innerBabbling[i].enumerated() {
            if innerBabbling[i].count == 1 {
                answer += 1
                break
            }
            if index > 0 && j == Array(innerBabbling[i])[index - 1] {
                break
            } else if index == innerBabbling[i].count - 1 && j != Array(innerBabbling[i])[index - 1] {
                answer += 1
                break
            }
        }
    }
    return answer
}