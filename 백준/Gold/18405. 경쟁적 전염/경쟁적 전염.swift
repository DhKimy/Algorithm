func boj_18405() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (input[0], input[1])
    let dir: [(x: Int, y: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var graph = [[Int]]()
    var queue = [(x: Int, y: Int, type: Int, time: Int)]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    let inputSXY = readLine()!.split(separator: " ").map { Int($0)! }
    let (s, x, y) = (inputSXY[0], inputSXY[1], inputSXY[2])

    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] != 0 {
                queue.append((j, i, graph[i][j], 1))
                visited[i][j] = true
            }
        }
    }

    queue.sort { $0.type < $1.type }

    while !queue.isEmpty {
        let first = queue.removeFirst()

        if first.time > s {
            break
        }

        for i in dir {
            let newX = first.x + i.x
            let newY = first.y + i.y

            if newX >= 0 && newY >= 0 && newX < n && newY < n && !visited[newY][newX] && graph[newY][newX] == 0 {
                graph[newY][newX] = first.type
                queue.append((newX, newY, first.type, first.time + 1))
                visited[newY][newX] = true
            }
        }
    }

    print(graph[x - 1][y - 1])
}

boj_18405()