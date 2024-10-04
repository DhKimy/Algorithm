func boj_14501() {
    let n = Int(readLine()!)!
    var arr: [(t: Int, p: Int)] = []
    var dp = [Int](repeating: 0, count: n + 1)

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }

        arr.append((input[0], input[1]))
    }

    for i in stride(from: n - 1, to: -1, by: -1) {
        if i + arr[i].t > n {
            dp[i] = dp[i + 1]
        } else {
            dp[i] = max(dp[i + 1], dp[i + arr[i].t] + arr[i].p)
        }
    }

    print(dp[0])
}

boj_14501()