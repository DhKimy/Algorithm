func boj_1012() {
    let t = Int(readLine()!)!

    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (m, n, k) = (input[0], input[1], input[2])
        var cabbagePos = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        var queue = [(Int, Int)]()
        var bugCount = 0

        // 배추 위치 저장
        for _ in 0..<k {
            let pos = readLine()!.split(separator: " ").map { Int($0)! }
            cabbagePos[pos[1]][pos[0]] = 1
        }

        // BFS 탐색
        for y in 0..<n {
            for x in 0..<m {
                if cabbagePos[y][x] == 1 && !visited[y][x] {
                    bugCount += 1
                    bfs(startX: x, startY: y, &cabbagePos, &visited, &queue)
                }
            }
        }

        print(bugCount)
    }

    func bfs(startX: Int, startY: Int, _ cabbagePos: inout [[Int]], _ visited: inout [[Bool]], _ queue: inout [(Int, Int)]) {
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]

        queue.append((startX, startY))
        visited[startY][startX] = true

        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()

            for i in 0..<4 {
                let newX = x + dx[i]
                let newY = y + dy[i]

                if newX >= 0 && newX < cabbagePos[0].count && newY >= 0 && newY < cabbagePos.count {
                    if cabbagePos[newY][newX] == 1 && !visited[newY][newX] {
                        queue.append((newX, newY))
                        visited[newY][newX] = true
                    }
                }
            }
        }
    }
}

boj_1012()