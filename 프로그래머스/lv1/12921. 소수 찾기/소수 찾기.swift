func solution(_ n:Int) -> Int {
    var numArray = [Int](repeating: 0, count: n + 1)
    for i in 2 ... n {
        numArray[i] = i
    }

    for i in 2 ... n {
        if numArray[i] == 0 {
            continue
        }
        // 
        for j in stride(from: i + i, through: n, by: i) {
            numArray[j] = 0;
        }
    }

    return numArray.filter({ $0 != 0 }).count
}