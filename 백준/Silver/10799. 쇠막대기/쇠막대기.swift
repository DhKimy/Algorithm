func boj_10799() {
    let input = readLine()!.map { $0 }
    var stack = [Character]()
    var result = 0

    for (idx, i) in input.enumerated() {
        if stack.isEmpty {
            stack.append(i)
            continue
        }

        if i == ")" {
            stack.removeLast()
            if input[idx - 1] == i {
                result += 1
            } else {
                result += stack.count
            }
        } else {
            stack.append(i)
        }
    }

    print(result)
}

boj_10799()