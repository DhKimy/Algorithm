func boj_3273() {
    readLine()
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    let x = Int(readLine()!)!
    var arr = [Int](repeating: 0, count: 2000001)
    var answer = 0

    for num in nums {
        if x - num < 0 || x - num > 2000000 {
            continue
        }

        if arr[x - num] == 1 {
            answer += 1
        }

        arr[num] = 1
    }

    print(answer)
}

boj_3273()