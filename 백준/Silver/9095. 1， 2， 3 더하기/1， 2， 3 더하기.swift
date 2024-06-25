solution_9095_dp()

func solution_9095_dp() {
    let t = Int(readLine()!)!
    var n = [Int]()
    for _ in 1...t {
        n.append(Int(readLine()!)!)
    }
    var dp = [Int](repeating: 0, count: 12)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4

    for i in 4..<dp.count {
        dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
    }

    for i in n {
        print(dp[i])
    }
}