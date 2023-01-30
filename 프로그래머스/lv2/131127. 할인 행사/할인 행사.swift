import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var answer = 0
    var wantList: Dictionary = [String : Int]()
    initWantList(&wantList, want, number)
    for i in 0 ... discount.count - number.reduce(0, +) {
        for j in i ..< i + 10 {
            if wantList.contains(where: { $0.key == discount[j] }) {
                wantList[discount[j]]! -= 1
            } else {
                break
            }
            if wantList[discount[j]]! < 0 {
                break
            }
            if j == i + 9 && wantList.map({ (key: String, value: Int) -> Int in return value}).reduce(0, +) == 0 {
                answer += 1
            }
        }
        initWantList(&wantList, want, number)
    }
    return answer
}

func initWantList(_ wantList : inout [String : Int], _ want: [String], _ number: [Int]) {
    for (index, i) in want.enumerated() {
        wantList[i] = number[index]
    }
}