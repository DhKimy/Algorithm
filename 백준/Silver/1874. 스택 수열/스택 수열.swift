func boj_1874() {
    let n = Int(readLine()!)!
    var stack = [Int]()
    var target = [Int]()
    var currentNum = 1
    var answer = [String]()

    for _ in 0..<n {
        target.append(Int(readLine()!)!)
    }

    for i in target {

        while currentNum <= n + 1 {
            if stack.isEmpty {
                stack.append(currentNum)
                currentNum += 1
                answer.append("+")
                continue
            }

            if stack.last! == i {
                stack.removeLast()
                answer.append("-")
                break
            } else {
                stack.append(currentNum)
                answer.append("+")
            }

            currentNum += 1
        }

        if currentNum > n + 1 {
            print("NO")
            return
        }
    }

    for i in answer {
        print(i)
    }
}

boj_1874()