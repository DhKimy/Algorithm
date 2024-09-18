func boj_1992() {
    let n = Int(readLine()!)!
    var pixel = [[Int]]()

    for _ in 0..<n {
        let row = readLine()!.map { Int(String($0))! }
        pixel.append(row)
    }

    divide(0, 0, n)
    print()

    // 모두 같은 수인지 체크
    func checkSameNum(_ x: Int, _ y: Int, _ size: Int) -> Bool {
        let first = pixel[y][x]

        for i in y..<y+size {
            for j in x..<x+size {
                if first != pixel[i][j] {
                    return false
                }
            }
        }
        return true
    }

    // 분할
    func divide(_ x: Int, _ y: Int, _ size: Int) {
        // 다음 사이즈에 맞춰서 모두 같은 수인지 체크
        if checkSameNum(x, y, size) {
            print(pixel[y][x], terminator: "")
            return
        }

        // 분할되는 곳이기에 여는 괄호 프린트
        print("(", terminator: "")
        // 아니라면 다시 분할
        let newSize = size / 2
        for i in 0..<2 {
            for j in 0..<2 {
                divide(x + j * newSize, y + i * newSize, newSize)
            }
        }

        // 하위의 모든 곳을 분할하고 돌아온 곳이기에 닫는 괄호 프린트
        print(")", terminator: "")
    }
}

boj_1992()