func boj_1780() {
    let n = Int(readLine()!)!

    var paper = [[Int]]()
    var result = [0, 0, 0]

    for _ in 0..<n {
        paper.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    divide(0, 0, n)

    result.forEach { print($0) }

    // 전체 사각형이 모두 같은 숫자로 되어 있는지 판단
    // 같지 않으면 false, 모두 같으면 true
    func check(_ x: Int, _ y: Int, _ size: Int) -> Bool {
        let first = paper[x][y]
        for i in x..<x+size {
            for j in y..<y+size {
                if paper[i][j] != first {
                    return false
                }
            }
        }
        return true
    }

    func divide(_ x: Int, _ y: Int, _ size: Int) {
        // 현재 사이즈에 맞춰서 현재 사이즈 만큼의 사각형이 모두 같은 숫자로 되어 있는지 확인
        if check(x, y, size) {
            result[paper[x][y] + 1] += 1
            return
        }

        // 같지 않다면 분할하여 탐색함(9개의 영역으로 쪼갬)
        let newSize = size / 3
        for i in 0..<3 {
            for j in 0..<3 {
                divide(x + i * newSize, y + j * newSize, newSize)
            }
        }
    }
}

boj_1780()