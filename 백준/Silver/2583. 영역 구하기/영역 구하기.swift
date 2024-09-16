func boj_2583() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n, k) = (input[0], input[1], input[2])
    let dir = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    var rectCount = 0
    var rectSize = [Int]()

    for _ in 0..<k {
        let posInput = readLine()!.split(separator: " ").map { Int($0)! }
        let (x1, y1) = (posInput[0], posInput[1])
        let (x2, y2) = (posInput[2], posInput[3])

        for y in min(y1, y2)..<max(y1, y2) {
            for x in min(x1, x2)..<max(x1, x2) {
                graph[y][x] = 1
            }
        }
    }

    var queue = [(x: Int, y: Int)]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)

    for y in 0..<m {
        for x in 0..<n {
            var currentSize = 1

            if visited[y][x] || graph[y][x] == 1 {
                continue
            } else {

                queue.append((x, y))
                visited[y][x] = true

                while !queue.isEmpty {
                    let queueFirst = queue.removeFirst()

                    for i in 0..<4 {
                        let newX = queueFirst.x + dir[i].0
                        let newY = queueFirst.y + dir[i].1

                        if newX >= 0 && newY >= 0 && newX < n && newY < m && !visited[newY][newX] && graph[newY][newX] == 0 {
                            queue.append((newX, newY))
                            visited[newY][newX] = true
                            currentSize += 1
                        }
                    }
                }
            }

            rectSize.append(currentSize)
            rectCount += 1
        }
    }

    print(rectCount)
    print(rectSize.sorted().map { String($0) }.joined(separator: " "))
}

boj_2583()