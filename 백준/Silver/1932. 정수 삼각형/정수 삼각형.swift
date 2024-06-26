solution_1932()

func solution_1932() {
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)

    for _ in 1...n {
        arr.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    }

    print(dynamicProgram(0, 0))

    func dynamicProgram(_ idx: Int, _ depth: Int) -> Int {
        if depth == n - 1 {
            dp[depth][idx] = arr[depth][idx]
            return arr[depth][idx]
        }

        if dp[depth][idx] == -1 {
            let maxVal = max(dynamicProgram(idx, depth + 1), dynamicProgram(idx + 1, depth + 1)) + arr[depth][idx]
            dp[depth][idx] = maxVal
            return maxVal
        } else {
            return dp[depth][idx]
        }
    }
}