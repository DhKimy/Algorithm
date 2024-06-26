solution_2606()

func solution_2606() {
    let computer = Int(readLine()!)!
    let lineCount = Int(readLine()!)!
    var arr = [[Int]](repeating: [Int](), count: computer + 1)

    if lineCount == 0 {
        print(0)
        return
    }

    for _ in 1...lineCount {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        arr[input[0]].append(input[1])
        arr[input[1]].append(input[0])
    }

    var answer = 0
    var queue: [(idx: Int, arr: [Int])] = [(1, arr[1])] // 초기화
    var visited = [Bool](repeating: false, count: computer + 1)

    while !queue.isEmpty {
        let first = queue.removeFirst()

        if !visited[first.idx] {
            visited[first.idx] = true
            for i in first.arr {
                queue.append((i, arr[i]))
            }
            answer += 1
        }
    }

    print(answer - 1)
}
