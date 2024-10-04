func boj_1269() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }.reduce(0, +)
    let setA = Set(readLine()!.split(separator: " ").map { Int($0)! })
    let interCnt = setA.intersection(Array(readLine()!.split(separator: " ").map { Int($0)! })).count

    print(input - (2 * interCnt))
}

boj_1269()