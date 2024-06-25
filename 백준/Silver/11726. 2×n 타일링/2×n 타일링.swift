solution_11726()

func solution_11726() {
    let n = Int(readLine()!)!
    var dp = [0, 1, 2]

    if n <= 2 {
        print(dp[n])
        return
    }

    for i in 3...n {
        dp.append((dp[i - 1] + (dp[i - 2])) % 10007)
    }

    print(dp[n])
}