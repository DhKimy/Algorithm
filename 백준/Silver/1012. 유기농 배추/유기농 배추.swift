solution_1012_solve()

func solution_1012_solve() {
    let t = Int(readLine()!)!

    for _ in 0..<t {
        solution_1012()
    }
}

private func solution_1012() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (m, n, k) = (input[0], input[1], input[2]) // 가로, 세로, 배추 개수
    var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var queue = [(x: Int, y: Int)]()
    var waiting = [(x: Int, y: Int)]()
    var answer = 0
    let directions = [(0, -1), (0, 1), (-1, 0), (1, 0)] // 상하좌우
    for _ in 0..<k {
        let pos = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[pos[1]][pos[0]] = 1
        waiting.append((pos[0], pos[1]))
    }

    while !waiting.isEmpty {
        let first = waiting.removeFirst()

        if visited[first.y][first.x] {
            continue
        } else {
            queue.append((first.x, first.y))
            visited[first.y][first.x] = true
            bfs()
            answer += 1
        }
    }

    print(answer)

    func bfs() {
        while !queue.isEmpty {
            let first = queue.removeFirst()

            for direction in directions {
                let movedX = first.x + direction.0
                let movedY = first.y + direction.1
                if movedX < 0 || movedY < 0 || movedX > m - 1 || movedY > n - 1 {
                    continue
                }

                if !visited[movedY][movedX] && graph[movedY][movedX] == 1 {
                    visited[movedY][movedX] = true
                    queue.append((movedX, movedY))
                }
            }
        }
    }
}