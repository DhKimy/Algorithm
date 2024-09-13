func boj_17298() {
    let n = Int(readLine()!)!
    var arrA = readLine()!.split(separator: " ").map { Int($0)! }
    var stack = [Int]()
    var result = [Int](repeating: -1, count: n)

    for i in 0..<n {
        while !stack.isEmpty && arrA[stack.last!] < arrA[i] {
            let idx = stack.removeLast()
            result[idx] = arrA[i]
        }

        stack.append(i)
    }

    print(result.map { String($0) }.joined(separator: " "))
}

boj_17298()