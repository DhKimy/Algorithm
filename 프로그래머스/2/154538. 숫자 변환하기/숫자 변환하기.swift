import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    if x == y { return 0 }

    var visited = [Bool](repeating: false, count: 1000001)
    var queue = [(n: Int, cnt: Int)]()
    var head = 0
    var queueCnt = 0

    queue.append((x, 0))
    queueCnt += 1
    visited[x] = true

    while queueCnt > head {
        let first = queue[head]
        head += 1

        if first.n == y {
            return first.cnt
        }

        if first.n * 2 <= y && !visited[first.n * 2]{
            queue.append((first.n * 2, first.cnt + 1))
            queueCnt += 1
            visited[first.n * 2] = true
        }

        if first.n * 3 <= y && !visited[first.n * 3]{
            queue.append((first.n * 3, first.cnt + 1))
            queueCnt += 1
            visited[first.n * 3] = true
        }

        if first.n + n <= y && !visited[first.n + n] {
            queue.append((first.n + n, first.cnt + 1))
            queueCnt += 1
            visited[first.n + n] = true
        }
    }

    return -1
}