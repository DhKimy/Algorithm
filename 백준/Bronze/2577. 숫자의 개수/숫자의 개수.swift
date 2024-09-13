func boj_2577() {
    let a = Int(readLine()!)!
    let b = Int(readLine()!)!
    let c = Int(readLine()!)!
    let sum = String(a * b * c).map { Int(String($0))! }
    var result = [Int](repeating: 0, count: 10)

    for i in sum {
        result[i] += 1
    }

    for i in result {
        print(i)
    }
}

boj_2577()