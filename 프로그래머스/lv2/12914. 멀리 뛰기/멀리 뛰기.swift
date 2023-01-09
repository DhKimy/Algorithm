func solution(_ n:Int) -> Int {
    var a1 = 1
    var a2 = 2
    var a3 = 3
    if n == 1 || n == 2 {
        return n
    } else {
        for _ in 3 ... n {
            a3 = (a1 + a2) % 1234567
            a1 = a2 % 1234567
            a2 = a3 % 1234567
        }
    }
    return a3
}