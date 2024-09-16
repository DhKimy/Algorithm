func boj_1697() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (input[0], input[1])

    if n == k {
        print(0)
        return
    }

    var visited = [Bool](repeating: false, count: 100001)
    var queue = [(n, 0)] // (현재 위치, 이동 횟수)
    var index = 0

    visited[n] = true

    while index < queue.count {
        let (current, time) = queue[index]
        index += 1

        if current == k {
            print(time)
            return
        }

        let nextPositions = [current - 1, current + 1, current * 2]

        for next in nextPositions {
            if next >= 0 && next < 100001 && !visited[next] {
                visited[next] = true
                queue.append((next, time + 1))
            }
        }
    }
}

boj_1697()