func boj_13549() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (input[0], input[1])
    var visited = [Bool](repeating: false, count: 100001)
    var queue = [(x: Int, count: Int)]()
    var head = 0
    var queueCount = 0

    if n >= k {
        print(abs(n - k))
        return
    }

    queue.append((n, 0))
    queueCount += 1

    visited[n] = true

    while !queue.isEmpty {
        let first = queue[head]
        head += 1
        let newPos = [first.x * 2, first.x - 1, first.x + 1]

        for (idx, pos) in newPos.enumerated() {
            if pos >= 0 && pos < 100001 && !visited[pos] {
                if pos == k {
                    if idx != 0 {
                        print(first.count + 1)
                    } else {
                        print(first.count)
                    }
                    return
                } else {
                    if idx != 0 {
                        queue.append((pos, first.count + 1))
                    } else {
                        queue.append((pos, first.count))
                    }
                    queueCount += 1
                    visited[pos] = true
                }
            }
        }
    }
}

boj_13549()