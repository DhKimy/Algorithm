import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var leftHandPosition = [0, 3]
    var rightHandPosition = [2, 3]
    var answer = [Character]()
    
    for i in numbers {
        if i == 1 || i == 4 || i == 7 {
            answer.append("L")
            leftHandPosition = [0, i / 3]
        } else if i == 3 || i == 6 || i == 9 {
            answer.append("R")
            rightHandPosition = [2, i / 3 - 1]
        } else {
            var tempPosition = [Int]()
            switch i {
            case 2:
                tempPosition = [1, 0]
                answer.append(rightOrLeft(tempPosition, leftHandPosition, rightHandPosition, hand))
                if answer.last == "L" {
                    leftHandPosition = tempPosition
                } else {
                    rightHandPosition = tempPosition
                }
            case 5:
                tempPosition = [1, 1]
                answer.append(rightOrLeft(tempPosition, leftHandPosition, rightHandPosition, hand))
                if answer.last == "L" {
                    leftHandPosition = tempPosition
                } else {
                    rightHandPosition = tempPosition
                }
            case 8:
                tempPosition = [1, 2]
                answer.append(rightOrLeft(tempPosition, leftHandPosition, rightHandPosition, hand))
                if answer.last == "L" {
                    leftHandPosition = tempPosition
                } else {
                    rightHandPosition = tempPosition
                }
            case 0:
                tempPosition = [1, 3]
                answer.append(rightOrLeft(tempPosition, leftHandPosition, rightHandPosition, hand))
                if answer.last == "L" {
                    leftHandPosition = tempPosition
                } else {
                    rightHandPosition = tempPosition
                }
            default:
                break
            }
        }
    }
    return String(answer)
}

func rightOrLeft(_ tempPosition: [Int], _ left: [Int], _ right: [Int], _ hand: String) -> Character {
    let leftDistance = abs(tempPosition[0] - left[0]) + abs(tempPosition[1] - left[1])
    let rightDistance = abs(tempPosition[0] - right[0]) + abs(tempPosition[1] - right[1])
    if leftDistance > rightDistance {
        return "R"
    } else if leftDistance < rightDistance {
        return "L"
    } else {
        if hand == "right" {
            return "R"
        } else {
            return "L"
        }
    }
}