solution_11399()

func solution_11399() {
    _ = Int(readLine()!)!
    let times = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted(by: <)
    var answer = 0

    for i in 0..<times.count {
        answer += times[0...i].reduce(0, +)
    }

    print(answer)
}