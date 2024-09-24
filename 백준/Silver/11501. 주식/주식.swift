func boj_11501() {
    let t = Int(readLine()!)!
    var answer = ""

    for _ in 0..<t {
        let n = Int(readLine()!)!
        let prices = readLine()!.split(separator: " ").map { Int($0)! }

        var maxPrice = 0
        var profit = 0

        for i in (0..<n).reversed() {
            if prices[i] > maxPrice {
                maxPrice = prices[i]
            } else {
                profit += maxPrice - prices[i]
            }
        }

        answer += "\(profit)\n"
    }

    print(answer)
}

boj_11501()