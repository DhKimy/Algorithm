func solution(_ a:Int, _ b:Int) -> Int64 {
    var sum = 0
    var a = a
    if a <= b {
        for _ in 0 ... b - a {
            sum += a
            a += 1
        }
    } else {
       for _ in 0 ... a - b {
            sum += a
            a -= 1
        } 
    }
    return Int64(sum)
}