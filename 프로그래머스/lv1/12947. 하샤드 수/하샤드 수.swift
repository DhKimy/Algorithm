func solution(_ x:Int) -> Bool {
    var stringX = String(x)
    var sum = 0
    for i in stringX {
        sum += Int(String(i))!
    }
    return x % sum == 0 ? true : false
}