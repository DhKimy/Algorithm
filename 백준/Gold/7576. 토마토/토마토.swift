let input = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (input[0], input[1])
var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var queue: [(x: Int, y: Int, count: Int)] = []
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let direction = [(0, -1), (0, 1), (-1, 0), (1, 0)]
var answer = 0

for y in 0..<n {
    for x in 0..<m {
        if graph[y][x] == 1 {
            queue.append((x, y, 0))
            visited[y][x] = true
        } else if graph[y][x] == -1 {
            visited[y][x] = true
        }
    }
}

var idx = 0
while idx < queue.count {
    let first = queue[idx]
    idx += 1

    for dir in direction {
        let changedX = first.x + dir.0
        let changedY = first.y + dir.1

        if changedX < 0 || changedY < 0 || changedX > m - 1 || changedY > n - 1{
            continue
        }

        if graph[changedY][changedX] == 0 && !visited[changedY][changedX] {
            visited[changedY][changedX] = true
            queue.append((changedX, changedY, first.count + 1))
            answer = max(answer, first.count + 1)
        }
    }
}

var isValid = true
for i in visited {
    for j in i {
        if j == false {
            isValid = false
        }
    }
}

print(isValid ? answer : -1)