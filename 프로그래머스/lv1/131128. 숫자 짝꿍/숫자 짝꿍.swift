import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var innerX = [Int](repeating: 0, count: 10)
    for i in 0 ... innerX.count - 1 {
        var count = X.filter({ $0 == Character(String(i)) }).count
        innerX[i] = count
    }
    var innerY = [Int](repeating: 0, count: 10)
    for i in 0 ... innerY.count - 1 {
        var count = Y.filter({ $0 == Character(String(i)) }).count
        innerY[i] = count
    }
    
    var answer = [Character]()
    
    var j = 0
    for i in innerX {
        if i == 0 || innerY[j] == 0 {
            
        } else if i >= innerY[j] {
            for _ in 1 ... innerY[j] {
                answer.append(Character(String(j)))
            }
        } else {
            for _ in 1 ... i {
                answer.append(Character(String(j)))
            }
        }
        j += 1
    }
    return answer.count == 0 ? "-1" : answer.sorted(by: >)[0] == "0" ? "0" : String(answer.sorted(by: >))
}