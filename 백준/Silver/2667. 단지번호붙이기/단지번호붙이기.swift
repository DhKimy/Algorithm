func boj_2667() {
    let n = Int(readLine()!)!
    let dir = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var graph = [[Int]]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var counts = [Int]()
    var queue = [(x: Int, y: Int)]()

    for _ in 0..<n {
        graph.append(readLine()!.map { Int(String($0))! })
    }

    for y in 0..<n {
        for x in 0..<n {
            var size = 1

            if graph[y][x] == 0 || visited[y][x] {
                continue
            } else {
                queue.append((x, y))
                visited[y][x] = true

                while !queue.isEmpty {
                    let first = queue.removeFirst()

                    for i in dir {
                        let newX = first.x + i.0
                        let newY = first.y + i.1

                        if newX >= 0 && newY >= 0 && newX < n && newY < n && !visited[newY][newX] && graph[newY][newX] == 1 {
                            queue.append((newX, newY))
                            visited[newY][newX] = true
                            size += 1
                        }
                    }
                }
            }

            counts.append(size)
        }
    }

    print(counts.count)
    for count in counts.sorted() {
        print(count)
    }
}

boj_2667()