func boj_1919() {
    let n = readLine()!.map { $0 }
    let m = readLine()!.map { $0 }

    var result = 0
    var arr1 = [Int](repeating: 0, count: 27)
    var arr2 = [Int](repeating: 0, count: 27)

    for i in n {
        let idx = i.asciiValue! - 97
        arr1[Int(idx)] += 1
    }

    for i in m {
        let idx = i.asciiValue! - 97
        arr2[Int(idx)] += 1
    }

    for i in 0..<27 {
        if arr1[i] != arr2[i] {
            result += abs(arr1[i] - arr2[i])
        }
    }

    print(result)
}

boj_1919()