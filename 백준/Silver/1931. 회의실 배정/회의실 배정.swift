solution_1931()

func solution_1931() {
    let n = Int(readLine()!)!
    var arr = [(time: [Int], timeCount: Int)]()
    for _ in 1...n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        arr.append(([input[0], input[1]], input[1] - input[0]))
    }

    arr.sort {
        ($0.time[1], $0.time[0], $0.timeCount) < ($1.time[1], $1.time[0], $1.timeCount)
    }

    var temp = [arr[0]]
    for i in 1..<arr.count {
        let element = arr[i]
        let tempLast = temp.last!

        if element.time[0] >= tempLast.time[1] {
            temp.append(element)
        }
    }

    print(temp.count)
}