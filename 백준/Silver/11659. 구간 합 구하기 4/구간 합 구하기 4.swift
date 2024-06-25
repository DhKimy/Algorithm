solution_11659()

func solution_11659() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m) = (input[0], input[1])
    let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
    var arr = [[Int]]()
    var dp = [0]

    for _ in 1...m {
        arr.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    }

    // 누적합 초기화
    for i in 1...n {
        dp.append(dp[i - 1] + nums[i - 1])
    }

    for i in arr {
        print(dp[i[1]] - dp[i[0] - 1])
    }
}