import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var radix = String(n, radix: k).split(separator: "0").filter({ $0 != "1" })
    for i in radix {
        if !isPrime(Int(i)!) {
            radix.remove(at: radix.firstIndex(of: i)!)
        }
    }
    return radix.count
}

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    for i in 2 ... Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    return true
}