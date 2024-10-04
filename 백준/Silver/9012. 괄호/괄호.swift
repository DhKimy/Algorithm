func boj_9012() {
    let t = Int(readLine()!)!
    var answer = ""

    for _ in 0..<t {
        calParen()
    }

    print(answer)

    func calParen() {
        let input = readLine()!.map { $0 }
        var stack = [Character]()

        for paren in input {
            if stack.isEmpty && paren == ")" {
                answer += "NO\n"
                return
            }

            if paren == "(" {
                stack.append(paren)
            } else {
                stack.removeLast()
            }
        }

        if stack.isEmpty {
            answer += "YES\n"
        } else {
            answer += "NO\n"
        }
    }
}

boj_9012()