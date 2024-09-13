func boj_1158() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (input[0], input[1])

    var arr = Array(1...n)
    var result = [Int]()
    var idx = k - 1

    while !arr.isEmpty {
        result.append(arr.remove(at: idx))
        if arr.isEmpty { break }
        idx = (idx + k - 1) % arr.count
    }

    print("<\(result.map { String($0) }.joined(separator: ", "))>")
}

boj_1158()