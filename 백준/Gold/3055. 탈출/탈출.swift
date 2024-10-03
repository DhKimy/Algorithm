func boj_3055() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (r, c) = (input[0], input[1])
    let dir: [(x: Int, y: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var graph = [[Character]]()

    for _ in 0..<r {
        graph.append(Array(readLine()!))
    }

    var waterQueue = [(x: Int, y: Int, time: Int)]()
    var hedgehogQueue = [(x: Int, y: Int, time: Int)]()
    var visitedD = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
    var visitedW = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)

    // 초기 위치 설정
    for i in 0..<r {
        for j in 0..<c {
            if graph[i][j] == "S" {
                hedgehogQueue.append((j, i, 0))
                visitedD[i][j] = true
            }
            if graph[i][j] == "*" {
                waterQueue.append((j, i, 0))
                visitedW[i][j] = true
            }
        }
    }

    while !hedgehogQueue.isEmpty {
        // 1. 물 먼저 확산
        let waterSize = waterQueue.count
        for _ in 0..<waterSize {
            let first = waterQueue.removeFirst()

            for i in dir {
                let newX = first.x + i.x
                let newY = first.y + i.y

                if newX >= 0 && newY >= 0 && newX < c && newY < r && !visitedW[newY][newX] && graph[newY][newX] == "." {
                    graph[newY][newX] = "*"
                    waterQueue.append((newX, newY, first.time + 1))
                    visitedW[newY][newX] = true
                }
            }
        }

        // 2. 고슴도치 이동
        let hedgehogSize = hedgehogQueue.count
        for _ in 0..<hedgehogSize {
            let first = hedgehogQueue.removeFirst()

            for i in dir {
                let newX = first.x + i.x
                let newY = first.y + i.y

                if newX >= 0 && newY >= 0 && newX < c && newY < r && !visitedD[newY][newX] {
                    if graph[newY][newX] == "." {
                        graph[newY][newX] = "S"
                        hedgehogQueue.append((newX, newY, first.time + 1))
                        visitedD[newY][newX] = true
                    }

                    if graph[newY][newX] == "D" {
                        print(first.time + 1)
                        return
                    }
                }
            }
        }
    }

    print("KAKTUS")
}

boj_3055()