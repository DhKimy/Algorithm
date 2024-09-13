func boj_5397() {
    let t = Int(readLine()!)!
    var input = [String]()
    var result = [String]()

    for _ in 0..<t {
        input.append(readLine()!)
    }

    for i in input {
        var left = [Character]()
        var right = [Character]()

        for char in i {
            switch char {
                case "<":
                if !left.isEmpty {
                    right.append(left.removeLast())
                }
                case ">":
                if !right.isEmpty {
                    left.append(right.removeLast())
                }
                case "-":
                if !left.isEmpty {
                    left.removeLast()
                }
                default:
                left.append(char)
            }
        }

        result.append(String(left+right.reversed()))
    }

    for i in result {
        print(i)
    }
}

boj_5397()