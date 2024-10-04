func boj_1541() {
    let input = readLine()!.split(separator: "-")

    var arr = [Int]()
    var answer = 0

    for i in input {
        let nums = i.split(separator: "+").map { Int($0)! }.reduce(0, +)
        arr.append(nums)
    }

    answer = arr[0]

    for i in 1..<arr.count {
        answer -= arr[i]
    }

    print(answer)
}

boj_1541()