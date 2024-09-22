func boj_1620() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])

    var dictA = [Int: String]()
    var dictB = [String: Int]()

    for i in 0..<n {
        let read = readLine()!
        dictA[i + 1] = read
        dictB[read] = i + 1
    }

    for _ in 0..<m {
        let question = readLine()!

        if let quiz = Int(question) {
            print(dictA[quiz]!)
        } else {
            print(dictB[question]!)
        }
    }
}

boj_1620()