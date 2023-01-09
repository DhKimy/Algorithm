import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dictionary: [String : Int] = [:]
    for i in clothes {
        if dictionary.contains(where: { $0.key == i[1] }) {
            dictionary[i[1]]! += 1
        } else {
            dictionary[i[1]] = 1
        }
    }
    var clothesCount = [Int]()
    dictionary.forEach({
        clothesCount.append($0.value)
    })
    var answer = 1
    for i in clothesCount {
        answer *= (i + 1)
    }
    return answer - 1
}