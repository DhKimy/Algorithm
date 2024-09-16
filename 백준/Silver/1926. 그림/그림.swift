func boj_1926() {
    let input = readLine()!.split(separator: " ").map { Int($0)!}
    let (m, n) = (input[1], input[0])
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var graph = [[Int]]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var queue = [(x: Int, y: Int)]()
    var maxSurface = 0
    var count = 0

    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    for y in 0..<n {
        for x in 0..<m {
            if visited[y][x] {
                continue
            }
            if graph[y][x] == 1 {
                count += 1
                bfs(point: (x, y))
            }
        }
    }
    print(count)
    print(maxSurface)

    func bfs(point: (x: Int, y: Int)) {
        var currentSurface = 1

        queue.append(point)
        visited[point.y][point.x] = true

        while !queue.isEmpty {
            let curPoint = queue.removeFirst()

            for i in 0..<4 {
                let newX = curPoint.x + dx[i]
                let newY = curPoint.y + dy[i]

                if newX >= 0 && newY >= 0 && newX < m && newY < n && !visited[newY][newX] && graph[newY][newX] == 1{
                    queue.append((newX, newY))
                    visited[newY][newX] = true
                    currentSurface += 1
                }
            }
        }

        maxSurface = max(maxSurface, currentSurface)
    }
}

boj_1926()