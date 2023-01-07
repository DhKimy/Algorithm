import Foundation

func solution(_ new_id:String) -> String {
    // 1단계
    var id = new_id.map({ $0.isLetter ? Character($0.lowercased()) : $0 })
    
    // 2단계
    id = id.filter({ $0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "." })
    
    // 3단계
    for (index, i) in id.enumerated() {
        if index < id.count - 1 && i == "." && id[index + 1] == "." {
            id[index] = "@"
        }
    }
    id = id.filter({ $0 != "@" })
    
    // 4단계, 5단계
    if id.first == "." {
        id.removeFirst()
    }
    if id.last == "." {
        id.removeLast()
    }
    if id.count == 0 {
        id.append("a")
    }
    
    // 6, 7단계
    if id.count > 15 {
        var temp = [Character]()
        for (index, i) in id.enumerated() {
            if index < 15 {
                temp.append(i)
            } else {
                break
            }
        }
        if temp.last == "." {
            temp.removeLast()
        }
        id = temp
    } else if id.count < 3 {
        let temp = id.last!
        while id.count != 3 {
            id.append(temp)
        }
    }
    return String(id)
}