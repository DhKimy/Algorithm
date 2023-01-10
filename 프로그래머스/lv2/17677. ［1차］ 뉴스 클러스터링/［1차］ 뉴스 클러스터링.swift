func solution(_ str1:String, _ str2:String) -> Int {
    var string1 = Array(str1.lowercased()).compactMap({ String($0) })
    var string2 = Array(str2.lowercased()).compactMap({ String($0) })
    var similar1 = [String]()
    var similar2 = [String]()
    for (index, i) in string1.enumerated() {
        if index == string1.count - 1 {
            similar1.sort()
            break
        }
        if (i + string1[index + 1]).filter({ $0.isLetter }).count == 2 {
            similar1.append(i + string1[index + 1])
        }
    }
    for (index, i) in string2.enumerated() {
        if index == string2.count - 1 {
            similar2.sort()
            break
        }
        if (i + string2[index + 1]).filter({ $0.isLetter }).count == 2 {
            similar2.append(i + string2[index + 1])
        }
    }
    let wholeCount = similar1.count + similar2.count
    for (index, i) in similar1.enumerated() {
        if similar2.contains(i) {
            similar1[index] = ""
            similar2[similar2.firstIndex(of: i)!] = ""
        }
    }
    let interCount = (similar1.filter({ $0 == "" }).count + similar2.filter({ $0 == "" }).count) / 2
    let unionCount = wholeCount - interCount
    
    return unionCount != 0 ? Int(Double(interCount) / Double(unionCount) * Double(65536)) : 65536
}