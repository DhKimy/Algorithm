solution_12865()

func solution_12865() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, k) = (input[0], input[1])
    var arr: [[Int]] = []
    var dp = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: n + 1)

    for _ in 1...n {
        arr.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    }

    for i in 1...n {
        let (weight, value) = (arr[i - 1][0], arr[i - 1][1])

        for w in 0...k {
            if w >= weight {
                dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weight] + value)
            } else {
                dp[i][w] = dp[i - 1][w]
            }
        }
    }
    print(dp[n][k])
}