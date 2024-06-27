solution_3190_advanced()

func solution_3190_advanced() {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    graph[0][0] = 1  // 뱀의 시작 위치를 표시

    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[input[0] - 1][input[1] - 1] = -1  // 사과의 위치를 표시
    }

    let l = Int(readLine()!)!
    var directions = [Int: String]()
    for _ in 0..<l {
        let input = readLine()!.split(separator: " ").map { String($0) }
        directions[Int(input[0])!] = input[1]  // 시간과 방향 전환 정보 저장
    }

    let direction = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var currentDirection = 0
    var snake = [(0, 0)]
    var time = 0

    while true {
        time += 1
        let head = snake.first!
        let newHead = (head.0 + direction[currentDirection].0, head.1 + direction[currentDirection].1)

        // 범위 벗어남 또는 자기 자신과 충돌 확인
        if newHead.0 < 0 || newHead.0 >= n || newHead.1 < 0 || newHead.1 >= n || graph[newHead.0][newHead.1] == 1 {
            break
        }

        // 사과를 먹지 않았을 때
        if graph[newHead.0][newHead.1] != -1 {
            let tail = snake.removeLast()  // 꼬리 제거
            graph[tail.0][tail.1] = 0
        }

        // 새로운 머리 위치 추가
        snake.insert(newHead, at: 0)
        graph[newHead.0][newHead.1] = 1

        // 방향 전환
        if let turn = directions[time] {
            if turn == "D" {
                currentDirection = (currentDirection + 1) % 4
            } else if turn == "L" {
                currentDirection = (currentDirection + 3) % 4
            }
        }
    }

    print(time)
}