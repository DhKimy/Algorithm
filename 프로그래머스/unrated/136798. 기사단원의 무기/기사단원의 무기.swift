import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var answer = [Int](repeating: 0, count: number)
    for i in 0 ... number - 1 {
        if limit == 1 {
            return number * limit
        }
        if i == 0 {
            answer[i] = 1
            continue
        }
        if isPrime(i + 1) {
            answer[i] = 2
            continue
        } else {
            answer[i] = divisionCount(i + 1, limit, power)
        }
    }
    return answer.reduce(0, +)
}

func isPrime(_ num: Int) -> Bool {
    if(num < 4) {
        return num == 1 ? false : true
    }
    for i in 2 ... Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

func divisionCount(_ num: Int, _ limit: Int, _ maxPower: Int) -> Int {
    var count = 0
    for i in 1 ... Int(sqrt(Double(num))) {
        if num % i == 0 {
            if num / i == i {
                count += 1
            } else {
                count += 2
            }
        }
    }
    if count > limit {
        return maxPower
    } else {
        return count
    }
}