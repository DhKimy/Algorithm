func boj_15988() {
    let t = Int(readLine()!)!
    var n = [Int]()
    for _ in 1...t {
        n.append(Int(readLine()!)!)
    }

    var dp = [Int](repeating: 0, count: 1000001)

    dp[1] = 1
    dp[2] = 2
    dp[3] = 4

    for i in 4..<dp.count {
        dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 3]) % 1000000009
    }

    for i in n {
        print(dp[i])
    }
}

boj_15988()