import Foundation

func solution(_ s:String) -> String {
    var answer: [String] = s.components(separatedBy: " ")
    for i in 0 ... answer.count - 1 {
        var tempAnswer = [Character]()
        if answer[i].count == 0 {
            continue
        }
        
        for j in 0 ... answer[i].count - 1 {
            if j % 2 == 0 {
                tempAnswer.append(Character(Array(answer[i])[j].uppercased()))
            } else {
                tempAnswer.append(Character(Array(answer[i])[j].lowercased()))
            }
        }
        answer[i] = String(tempAnswer)
    }
    return answer.joined(separator: " ")
}