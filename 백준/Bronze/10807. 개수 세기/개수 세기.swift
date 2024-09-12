func boj_10807() {
    let n = Int(readLine()!)
    let number = readLine()!.split(separator: " ").map { Int($0) }
    let v = Int(readLine()!)
    var answer = 0

    for num in number {
        if num == v { answer += 1 }
    }

    print(answer)
}

boj_10807()