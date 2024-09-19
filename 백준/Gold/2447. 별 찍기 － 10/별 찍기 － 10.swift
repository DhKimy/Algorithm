func boj_2447() {
    let n = Int(readLine()!)!
    var starGraph = [[Character]](repeating: [Character](repeating: " ", count: n), count: n)

    printStar(0, 0, n)
    starGraph.forEach { print(String($0)) }

    func printStar(_ x: Int, _ y: Int, _ size: Int) {
        if size == 3 {
            let countY = y
            let countX = x
            for i in y..<y+size {
                for j in x..<x+size {
                    if i == y + 1 && j == x + 1 {
                        continue
                    } else {
                        starGraph[i][j] = "*"
                    }
                }
            }
            return
        }

        let newSize = size / 3
        for i in 0..<3 {
            for j in 0..<3 {
                if i == 1 && j == 1 {
                    continue
                } else {
                    printStar(x + j * newSize, y + i * newSize, newSize)
                }
            }
        }
    }
}

boj_2447()