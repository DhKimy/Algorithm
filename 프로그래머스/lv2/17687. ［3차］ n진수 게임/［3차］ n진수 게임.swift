func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var numbers: String = ""
    for i in 0 ... t * m {
        let temp = String(i, radix: n).uppercased()
        numbers += temp
    }
    
    let newNumbers = Array(numbers)
    var answer: String = ""
    for i in stride(from: p - 1, to: p - 1 + m * t, by: m) {
        answer += String(newNumbers[i])
    }
    return answer
}