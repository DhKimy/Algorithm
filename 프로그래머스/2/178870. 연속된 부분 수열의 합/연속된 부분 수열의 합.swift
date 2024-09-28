import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var head = 0
    var tail = 0

    var arr: (h: Int, t: Int) = (0, Int.max)
    var currentSum = sequence[0]

    while tail < sequence.count {
        if currentSum == k {
            if tail - head < arr.t - arr.h {
                arr = (head, tail)
            }
            tail += 1
            if tail < sequence.count {
                currentSum += sequence[tail]
            }
        } else if currentSum < k {
            tail += 1
            if tail < sequence.count {
                currentSum += sequence[tail]
            }
        } else {
            currentSum -= sequence[head]
            head += 1
        }
    }

    return [arr.h, arr.t]
}