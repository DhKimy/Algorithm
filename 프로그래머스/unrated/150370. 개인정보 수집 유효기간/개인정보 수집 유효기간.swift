import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var needToRemove = [Int]()
    var time: Dictionary = [String : Int]()
    for i in terms {
        time[String(i.split(separator: " ")[0])] = Int(i.split(separator: " ")[1])
    }
    let todayArray = today.split(separator: ".").compactMap({ Int($0) })
    let today = todayArray[0] * (28 * 12) + todayArray[1] * (28) + todayArray[2]
    for (index, i) in privacies.enumerated() {
        let tempArray = i.split(separator: " ")
        let dDayArray = tempArray[0].split(separator: ".").compactMap({ Int($0) })
        let dDay = dDayArray[0] * (28 * 12) + dDayArray[1] * 28 + dDayArray[2]
        
        if dDay + time[String(tempArray[1])]! * 28 <= today {
            needToRemove.append(index + 1)
        }
    }
    return needToRemove.sorted()
}