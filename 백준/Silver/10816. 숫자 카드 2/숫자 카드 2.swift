solution_10816()

func solution_10816() {
    let n = Int(readLine()!)!
    let intArr = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = Int(readLine()!)!
    let targetArr = readLine()!.split(separator: " ").compactMap { Int($0) }

    var dict: [Int: Int] = [:]

    for i in intArr {
        dict[i, default: 0] += 1
    }

    var answer: [Int] = []

    for i in targetArr {
        if let value = dict[i] {
            answer.append(value)
        } else {
            answer.append(0)
        }
    }

    print(answer.map { String($0) }.joined(separator: " "))
}