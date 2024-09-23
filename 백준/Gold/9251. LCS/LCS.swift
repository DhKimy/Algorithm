func boj_9251() {
    let wordA = readLine()!.map { $0 }
    let wordB = readLine()!.map { $0 }

    var lcs = 0
    var dp = [[Int]](repeating: [Int](repeating: 0, count: wordB.count + 1), count: wordA.count + 1)

    for i in 1...wordA.count {
        for j in 1...wordB.count {
            if wordB[j - 1] == wordA[i - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
                lcs = max(lcs, dp[i][j])
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                lcs = max(lcs, dp[i][j])
            }
        }
    }

    print(lcs)
}

boj_9251()