import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var stackTimeDict: Dictionary = [Int : Int]()
    var timeDict: Dictionary = [Int : Int]()
    
    for i in records {
        let temp = i.split(separator: " ")
        switch temp[2] {
        case "IN":
            let timeSet = temp[0].split(separator: ":").compactMap({ Int($0) })
            timeDict[Int(temp[1])!] = timeSet[0] * 60 + timeSet[1]
        case "OUT":
            let timeSet = temp[0].split(separator: ":").compactMap({ Int($0) })
            let outTime = timeSet[0] * 60 + timeSet[1]
            let parkTime = outTime - timeDict[Int(temp[1])!]!
            if stackTimeDict.contains(where: { $0.key == Int(temp[1])!}) {
                stackTimeDict[Int(temp[1])!]! += parkTime
                timeDict.remove(at: timeDict.firstIndex(where: { $0.key == Int(temp[1])!})!)
            } else {
                stackTimeDict[Int(temp[1])!] = parkTime
                timeDict.remove(at: timeDict.firstIndex(where: { $0.key == Int(temp[1])!})!)
            }
        default:
            return []
        }
    }
    if timeDict.count > 0 {
        for i in timeDict {
            if stackTimeDict.contains(where: { $0.key == i.key }) {
                stackTimeDict[i.key]! += 1439 - i.value
            } else {
                stackTimeDict[i.key] = 1439 - i.value
            }
        }
    }
    var sortDict = stackTimeDict.sorted(by: { $0.key < $1.key }).compactMap({ $0.value })
    for (index, i) in sortDict.enumerated() {
        var fee = fees[1]
        if i > fees[0] {
            fee += Int(ceil(Double(i - fees[0]) / Double(fees[2]))) * fees[3]
            sortDict[index] = fee
        } else {
            sortDict[index] = fee
        }
    }
    return sortDict
}