import Foundation

func solution(_ record:[String]) -> [String] {
    var result = [[String]]()
    var userList: Dictionary = [String : String]()
    for i in record {
        let temp = i.split(separator: " ").compactMap({ String($0) })
        switch temp[0] {
        case "Enter":
            userList[temp[1]] = temp[2]
            result.append([temp[1], "님이 들어왔습니다."])
        case "Leave":
            result.append([temp[1], "님이 나갔습니다."])
        case "Change":
            userList[temp[1]] = temp[2]
        default:
            break
        }
    }
    
    for (index, i) in result.enumerated() {
        result[index][0] = userList[i[0]]!
    }
    
    return result.compactMap({ $0.joined() })
}