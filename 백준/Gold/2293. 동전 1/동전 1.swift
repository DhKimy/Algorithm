solution_2293()

func solution_2293() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0]
    let k = input[1]
    var coins = [Int]()
    var dp = [Int](repeating: 0, count: k + 1)
    dp[0] = 1

    for _ in 0..<n {
        coins.append(Int(readLine()!)!)
    }

    for c in coins {
        for i in stride(from: c, to: k + 1, by: 1) {
            dp[i] = (dp[i] + dp[i - c]) % 2100000000
        }
    }

    print(dp[k])
}