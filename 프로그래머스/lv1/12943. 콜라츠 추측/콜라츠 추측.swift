func solution(_ num:Int) -> Int {
    if num == 1 {
        return 0
    }
    var number = num
    var i = 0
    for i in 0 ... 501 {
        if number % 2 == 0 {
            number /= 2
        } else {
            number = number * 3 + 1
        }
        if number == 1 {
            return i + 1
        }
        if i == 500 {
            return -1
        }
    }
    return 0
}