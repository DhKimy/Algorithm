func boj_11052() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }

    var dp = [Int](repeating: 0, count: n + 1)

    for i in 1...n {
        for j in 1...i {
            dp[i] = max(dp[i], dp[i - j] + arr[j - 1])
        }
    }

    print(dp[n])
}

boj_11052()