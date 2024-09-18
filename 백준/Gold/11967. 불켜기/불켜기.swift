func boj_11967() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])
    let directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]

    var graph = [[[(x: Int, y: Int)]]](repeating: [[(x: Int, y: Int)]](repeating: [(x: Int, y: Int)](), count: n + 1), count: n + 1)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)
    var lit = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)
    var queue = [(x: Int, y: Int)]()
    var waiting = [(x: Int, y: Int)]()  // 불이 켜졌지만 갈 수 없는 방들
    var result = 1
    
    for _ in 0..<m {
        let read = readLine()!.split(separator: " ").map { Int($0)! }
        graph[read[1]][read[0]].append((read[2], read[3]))
    }

    // 시작점
    queue.append((1, 1))
    visited[1][1] = true
    lit[1][1] = true
    
    while !queue.isEmpty {
        let point = queue.removeFirst()

        // 불을 켜는 작업
        for room in graph[point.y][point.x] {
            if !lit[room.y][room.x] {
                lit[room.y][room.x] = true
                result += 1
                waiting.append((room.x, room.y))  // 불이 켜졌지만 아직 방문 불가
            }
        }

        // 인접한 방들로 이동
        for dir in directions {
            let newX = point.x + dir.0
            let newY = point.y + dir.1
            
            if newX > 0 && newY > 0 && newX <= n && newY <= n && lit[newY][newX] && !visited[newY][newX] {
                visited[newY][newX] = true
                queue.append((newX, newY))
            }
        }

        // 불이 켜졌지만 갈 수 없던 방 다시 체크
        var i = 0
        while i < waiting.count {
            let room = waiting[i]
            var canVisit = false
            for dir in directions {
                let adjX = room.x + dir.0
                let adjY = room.y + dir.1
                if adjX > 0 && adjY > 0 && adjX <= n && adjY <= n && visited[adjY][adjX] {
                    canVisit = true
                    break
                }
            }
            if canVisit {
                visited[room.y][room.x] = true
                queue.append(room)
                waiting.remove(at: i)
            } else {
                i += 1
            }
        }
    }

    print(result)
}

boj_11967()