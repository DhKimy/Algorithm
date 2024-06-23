let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = firstLine[0]
let m = firstLine[1]
var graph: [[Int]] = []
var queue: [(x: Int, y: Int, count: Int)] = [(0, 0, 1)]
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let direct = [(0, -1), (0, 1), (-1, 0), (1, 0)]
for _ in 0..<n {
    graph.append(readLine()!.map { Int(String($0))! })
}
var answer = 0

visited[0][0] = true

while !queue.isEmpty {
    let first = queue.removeFirst()

    if first.x == m - 1 && first.y == n - 1 {
        answer = first.count
        break
    }

    for i in direct {
        let changedX = first.x + i.0
        let changedY = first.y + i.1

        if changedX < 0 || changedY < 0 || changedX > m - 1 || changedY > n - 1 {
            continue
        }

        if graph[changedY][changedX] == 1 && !visited[changedY][changedX] {
            visited[changedY][changedX] = true
            queue.append((changedX, changedY, first.count + 1))
        }
    }
}

print(answer)