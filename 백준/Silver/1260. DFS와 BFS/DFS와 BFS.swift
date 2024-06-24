solution_1260()

func solution_1260() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m, v) = (input[0], input[1], input[2])
    var graph = [[Int]](repeating: [], count: n + 1)

    for _ in 1...m {
        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }

    for i in 1...n {
        graph[i].sort()
    }

    func dfs() {
        var visited = [Bool](repeating: false, count: n + 1)
        var dfsSeq = [Int]()

        func innerDfs(_ start: Int) {
            visited[start] = true
            dfsSeq.append(start)

            for node in graph[start] {
                if !visited[node] {
                    innerDfs(node)
                }
            }
        }

        innerDfs(v)
        print(dfsSeq.map { String($0) }.joined(separator: " "))
    }

    func bfs() {
        var queue: [Int] = [v]
        var visited = [Bool](repeating: false, count: n + 1)
        var bfsSeq: [Int] = []

        visited[v] = true

        while !queue.isEmpty {
            let current = queue.removeFirst()
            bfsSeq.append(current)

            for node in graph[current] {
                if !visited[node] {
                    queue.append(node)
                    visited[node] = true
                }
            }
        }

        print(bfsSeq.map { String($0) }.joined(separator: " "))
    }

    dfs()
    bfs()
}