func boj_2193() {
    let n = Int(readLine()!)!
    if n == 1 || n == 2 {
        print(1)
        return
    }

    var first = 1
    var second = 1

    for _ in 3...n {
        let sum = first + second
        first = second
        second = sum
    }
    print(second)
}

boj_2193()