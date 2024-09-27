import Foundation

func solution(_ numbers:String) -> Int { 
        
    
    func makeNumber(_ depth: Int, _ num: String) {
        if depth == numbers.count {
            numList.insert(Int(num)!)
            return
        }

        for (idx, i) in number.enumerated() {
            if !visited[idx] {
                visited[idx] = true
                makeNumber(depth + 1, num + i)
                makeNumber(depth + 1, i)
                visited[idx] = false
            }
        }
    }
    
    var visited = [Bool](repeating: false, count: numbers.count)
    var number = numbers.map { String($0) }
    var numList = Set<Int>()
    var answer = 0

    makeNumber(0, "")

    for i in numList {
        if isPrime(i) {
            answer += 1
        }
    }

    return answer
}

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num <= 1 ? false : true
    }

    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }

    return true
}
