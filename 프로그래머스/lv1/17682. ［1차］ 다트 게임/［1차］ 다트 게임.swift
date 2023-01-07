import Foundation

func solution(_ dartResult:String) -> Int {
    let dartResult = Array(dartResult)
    var answer = [Int]()
    var tempNumber = -1
    var j = 0
    for i in dartResult {
        if i.isNumber {
            if tempNumber == -1 {
                tempNumber = Int(String(i))!
            } else {
                tempNumber = 10
            }
        } else if i.isLetter {
            switch i {
            case "S":
                tempNumber *= 1
            case "D":
                tempNumber = Int(pow(Double(tempNumber), 2.0))
            case "T":
                tempNumber = Int(pow(Double(tempNumber), 3.0))
            default:
                continue
            }
            if j < dartResult.count - 1 && !(dartResult[j + 1].isNumber){
                j += 1
                continue
            } else {
                answer.append(tempNumber)
                tempNumber = -1
            }
        } else {
            switch i {
            case "*" :
                if answer.count == 0 {
                    answer.append(tempNumber * 2)
                    tempNumber = -1
                } else {
                    answer[answer.count - 1] = answer.last! * 2
                    answer.append(tempNumber * 2)
                    tempNumber = -1
                }
            default:
                answer.append(tempNumber * -1)
                tempNumber = -1
            }
        }
        j += 1
    }
    return answer.reduce(0, +)
}