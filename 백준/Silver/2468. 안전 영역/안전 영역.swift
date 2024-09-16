func boj_2468() {
    let n = Int(readLine()!)!
    let dir = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var graph = [[Int]]()
    var maxArea = 0
    var maxHight = 0

    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        graph.append(line)
        maxHight = max(maxHight, line.max()!)
    }

    for rain in 0..<maxHight {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var queue = [(x: Int, y: Int)]()
        var currentArea = 0

        for y in 0..<n {
            for x in 0..<n {
                if graph[y][x] > rain && !visited[y][x] {
                    queue.append((x, y))
                    visited[y][x] = true
                } else {
                    continue
                }

                while !queue.isEmpty {
                    let queueFirst = queue.removeFirst()

                    for i in 0..<4 {
                        let newX = queueFirst.x + dir[i].0
                        let newY = queueFirst.y + dir[i].1

                        if newX >= 0 && newY >= 0 && newX < n && newY < n && !visited[newY][newX] && graph[newY][newX] > rain {
                            queue.append((newX, newY))
                            visited[newY][newX] = true
                        }
                    }
                }

                currentArea += 1
            }
        }

        maxArea = max(maxArea, currentArea)
    }

    print(maxArea)
}

boj_2468()