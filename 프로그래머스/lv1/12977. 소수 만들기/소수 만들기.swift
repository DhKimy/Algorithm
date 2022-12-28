import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0

    for i in 0 ... nums.count - 3 {
        for j in i + 1 ... nums.count - 2 {
            for k in j + 1 ... nums.count - 1 {
                if isPrime(nums[i] + nums[j] + nums[k]) {
                    answer += 1
                }
            }
        }
    }
    return answer
}

func isPrime(_ n: Int) -> Bool {
    if n == 3 {
        return true
    }
    for i in 2 ... n - 1 {
        if n % i == 0 {
            return false
        }
    }
    return true
}