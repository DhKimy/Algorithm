func boj_5014() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (f, s, g) = (input[0], input[1], input[2])
    let (u, d) = (input[3], input[4])

    if s == g  {
        print(0)
        return
    }

    var queue = [(pos: Int, count: Int)]()
    var visited = [Bool](repeating: false, count: f + 1)

    queue.append((s, 0))
    visited[s] = true

    while !queue.isEmpty {
        let first = queue.removeFirst()

        if first.pos - d == g || first.pos + u == g {
            print(first.count + 1)
            return
        }

        if first.pos + u < f + 1 && !visited[first.pos + u] {
            queue.append((first.pos + u, first.count + 1))
            visited[first.pos + u] = true
        }

        if first.pos - d > 0 && !visited[first.pos - d] {
            queue.append((first.pos - d, first.count + 1))
            visited[first.pos - d] = true
        }
    }

    print("use the stairs")
}

boj_5014()