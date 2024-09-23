func boj_2302() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!

    var dp = [1, 1, 2]
    if n >= 3 {
        for i in 3...n {
            dp.append(dp[i - 1] + dp[i - 2])
        }
    }

    if m == 0 {
        print(dp[n])
        return
    }

    var vips = [Int]()
    for _ in 0..<m {
        vips.append(Int(readLine()!)!)
    }

    var result = 1
    var previousSeat = 0

    // 각 구간에서 가능한 좌석 배치 경우의 수 계산
    for vip in vips {
        let normalSeats = vip - previousSeat - 1
        result *= dp[normalSeats]
        previousSeat = vip
    }

    // 마지막 구간 처리 (마지막 VIP 이후 남은 좌석)
    let normalSeatsAfterLastVip = n - previousSeat
    result *= dp[normalSeatsAfterLastVip]

    print(result)
}

boj_2302()