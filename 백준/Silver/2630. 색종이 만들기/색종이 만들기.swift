func boj_2630() {
    let n = Int(readLine()!)!
    var paper = [[Int]]()
    var result = [0, 0] // 0: 하얀색, 1: 파란색

    for _ in 0..<n {
        paper.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    divide(0, 0, n)
    result.forEach { print($0) }

    func checkSameNum(_ x: Int, _ y: Int, _ size: Int) -> Bool {
        let first = paper[y][x]

        for i in y..<y+size {
            for j in x..<x+size {
                if first != paper[i][j] {
                    return false
                }

            }
        }
        return true
    }

    func divide(_ x: Int, _ y: Int, _ size: Int) {
        if checkSameNum(x, y, size) {
            result[paper[y][x]] += 1
            return
        }

        let newSize = size / 2
        for i in 0..<2 {
            for j in 0..<2 {
                divide(x + j * newSize, y + i * newSize, newSize)
            }
        }
    }
}

boj_2630()