import Foundation

func solution(_ book_time:[[String]]) -> Int {
    let sortedBookTime = book_time
        .sorted(by: { $0[0] < $1[0] })
        .map { $0.map { getStringToDate($0) } }
        var roomList: [[Int]] = []

        for (index, i) in sortedBookTime.enumerated() {
            if index == 0 {
                roomList.append(i)
                continue
            }

            for (idx, j) in roomList.enumerated() {
                if i[0] >= j.last! + 10 {
                    roomList[idx].append(i[1])
                    break
                } else if idx == roomList.count - 1 {
                    roomList.append(i)
                }
            }
        }
        return roomList.count
}

func getStringToDate(_ strDate: String) -> Int {
    let numbers = strDate.components(separatedBy: [":"])
    
    return Int(numbers[0])! * 60 + Int(numbers[1])!
}