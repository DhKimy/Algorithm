let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let m = firstLine[1]
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(
        readLine()!.split(separator: " ").map { Int($0)! }
    )
}
let direct = [(0, -1), (0, 1), (-1, 0), (1, 0)] // 상하좌우
var queue: [(x: Int, y: Int)] = []
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var count = 0
var surface = 0

for y in 0..<n {
    for x in 0..<m {
        if graph[y][x] == 1 && visited[y][x] == false {
            queue.append((x: x, y: y))
            visited[y][x] = true
            bfs()
            count += 1
        }
    }
}

func bfs() {
    var innerSurface = 1
    while !queue.isEmpty {
        let element = queue.removeFirst()

        for k in direct {
            let changedX = element.x + k.0
            let changedY = element.y + k.1

            if changedX < 0 || changedX >= m || changedY < 0 || changedY >= n {
                continue
            }

            if !visited[changedY][changedX] && graph[changedY][changedX] == 1 {
                visited[changedY][changedX] = true
                innerSurface += 1
                queue.append((changedX, changedY))
            } else {
                continue
            }
        }
    }
    surface = max(surface, innerSurface)
}

print(count)
print(surface)