solution_1003()

func solution_1003() {
    let t = Int(readLine()!)!
    var arr = [Int]()

    for _ in 1...t {
        arr.append(Int(readLine()!)!)
    }

    var zeroArr = [1, 0]
    var oneArr = [0, 1]

    for i in 2...40 {
        zeroArr.append(zeroArr[i-2] + zeroArr[i-1])
        oneArr.append(oneArr[i-2] + oneArr[i-1])
    }

    for i in arr {
        print("\(zeroArr[i]) \(oneArr[i])")
    }
}