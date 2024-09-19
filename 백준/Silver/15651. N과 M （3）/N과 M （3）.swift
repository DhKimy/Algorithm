func boj_15651() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])

    var arr = [Int](repeating: 0, count: n)
    var isUsed = [Bool](repeating: false, count: n)
    var output = ""

    dfs(0)
    print(output)
    func dfs(_ depth: Int) {
        if depth == m {
            output += arr.filter{ $0 != 0 }.map { String($0) }.joined(separator: " ") + "\n"
            return
        }

        for i in 0..<n {
            isUsed[i] = false
            if !isUsed[i] {
                arr[depth] = i + 1
                dfs(depth + 1)
                isUsed[i] = true
            }
        }
    }
}

boj_15651()