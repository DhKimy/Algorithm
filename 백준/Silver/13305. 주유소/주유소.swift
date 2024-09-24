func boj_13305() {
    let n = Int(readLine()!)!
    let distances = readLine()!.split(separator: " ").map { Int($0)! }
    let prices = readLine()!.split(separator: " ").map { Int($0)! }

    var curPrices = 1_000_000_001
    var answer = 0

    for i in 0..<n-1 {
        if curPrices > prices[i] {
            curPrices = prices[i]
        }

        answer += curPrices * distances[i]
    }

    print(answer)
}

boj_13305()