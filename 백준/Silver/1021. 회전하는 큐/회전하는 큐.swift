func boj_1021() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])
    var target = readLine()!.split(separator: " ").map { Int($0)! }
    var deque = Array(1...n)
    var answer = 0

    while !target.isEmpty {
        let targetIndex = deque.firstIndex(of: target[0])!
        let leftDistance = targetIndex
        let rightDistance = deque.count - targetIndex

        if leftDistance <= rightDistance { // 왼쪽으로 회전
            for _ in 0..<leftDistance {
                deque.append(deque.removeFirst())
                answer += 1
            }
        } else { // 오른쪽으로 회전
            for _ in 0..<rightDistance {
                deque.insert(deque.removeLast(), at: 0)
                answer += 1
            }
        }

        deque.removeFirst() // 타겟 숫자 제거
        target.removeFirst()
    }

    print(answer)
}

boj_1021()