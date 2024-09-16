func boj_7562() {
    let t = Int(readLine()!)!
    let dir = [(-1, 2), (-2, 1), (-2, -1), (-1, -2), (1, 2), (1, -2), (2, 1), (2, -1)]
    var result = ""

    for _ in 0..<t {
        let l = Int(readLine()!)!
        let startPoint = readLine()!.split(separator: " ").map { Int($0)! }
        let endPoint = readLine()!.split(separator: " ").map { Int($0)! }
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: l), count: l)
        var queue = [(x: Int, y: Int, length: Int)]()
        var head = 0

        if startPoint[0] == endPoint[0] && endPoint[1] == startPoint[1] {
            result += "0\n"
            continue
        }

        queue.append((startPoint[0], startPoint[1], 0))
        visited[startPoint[1]][startPoint[0]] = true

        while !queue.isEmpty {
            let first = queue[head]
            head += 1

            for i in dir {
                let newX = first.x + i.0
                let newY = first.y + i.1

                if newX >= 0 && newY >= 0 && newX < l && newY < l && !visited[newY][newX] {
                    if newX == endPoint[0] && newY == endPoint[1] {
                        result += "\(first.length + 1)\n"
                        queue.removeAll()
                        break
                    }

                    queue.append((newX, newY, first.length + 1))
                    visited[newY][newX] = true
                }
            }
        }
    }

    print(result)
}

boj_7562()