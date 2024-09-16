func boj_2178() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])
    let dir = [(-1, 0), (1, 0), (0, -1), (0, 1)]

    var graph = [[Int]]()
    var queue = [(x: Int, y: Int, length: Int)]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var length = 100000000

    for _ in 0..<n {
        graph.append(readLine()!.map { Int(String($0))! })
    }

    queue.append((0, 0, 1))
    visited[0][0] = true

    while !queue.isEmpty {
        let point = queue.removeFirst()

        for i in dir {
            let newX = point.x + i.0
            let newY = point.y + i.1

            if newX >= 0 && newY >= 0 && newX < m && newY < n && !visited[newY][newX] && graph[newY][newX] == 1 {
                queue.append((newX, newY, point.length + 1))
                visited[newY][newX] = true
            }

            if newX == m - 1 && newY == n - 1 {
                length = min(length, point.length + 1)
            }
        }
    }
    print(length)
}

boj_2178()