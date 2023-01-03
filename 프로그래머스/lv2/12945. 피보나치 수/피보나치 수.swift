func solution(_ n:Int) -> Int {
    if n == 2 {
        return 1
    }
    var number1:UInt64 = 1
    var number2:UInt64 = 1
    var number3:UInt64 = 0
    for _ in 3 ... n {
        number3 = (number2 + number1) % 1234567
        number1 = number2
        number2 = number3
    }
    return Int(number3 % 1234567)
}