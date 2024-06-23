solution_1697()

func solution_1697() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (input[0], input[1])

    if n == k {
        print(0)
        return
    }

    var visited = Array(repeating: false, count: 100001)
    var queue = [(position: Int, time: Int)]()
    queue.append((n, 0))
    visited[n] = true

    let directions = [-1, 1]

    var front = 0

    while front < queue.count {
        let (currentPosition, currentTime) = queue[front]
        front += 1

        let nextTime = currentTime + 1

        for direction in directions {
            let nextPosition = currentPosition + direction
            if nextPosition == k {
                print(nextTime)
                return
            }
            if nextPosition >= 0 && nextPosition <= 100000 && !visited[nextPosition] {
                visited[nextPosition] = true
                queue.append((nextPosition, nextTime))
            }
        }

        let teleportPosition = currentPosition * 2
        if teleportPosition == k {
            print(nextTime)
            return
        }
        if teleportPosition <= 100000 && !visited[teleportPosition] {
            visited[teleportPosition] = true
            queue.append((teleportPosition, nextTime))
        }
    }
}