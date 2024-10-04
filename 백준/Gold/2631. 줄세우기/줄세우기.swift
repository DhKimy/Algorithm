func boj_2631() {
    let n = Int(readLine()!)!
    var students = [Int]()
    var dp = [Int](repeating: 1, count: n)

    for _ in 0..<n {
        students.append(Int(readLine()!)!)
    }

    for i in 1..<n {
        for j in 0..<i {
            if students[j] < students[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }

    print(n - dp.max()!)
}

boj_2631()