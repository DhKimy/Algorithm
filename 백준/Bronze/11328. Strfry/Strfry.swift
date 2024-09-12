func boj_11328() {
    let n = Int(readLine()!)!
    var answer: [String] = []

    for i in 0..<n {
        let words = readLine()!.split(separator: " ").map { $0.sorted(by: >) }
        if words[0] == words[1] {
            answer.append("Possible")
        } else {
            answer.append("Impossible")
        }
    }

    for word in answer {
        print(word)
    }
}

boj_11328()