import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = Array(repeating: -1, count: numbers.count)
    var stack = [Int]()

    for i in stride(from: numbers.count - 1, through: 0, by: -1) {
        while !stack.isEmpty && stack.last! <= numbers[i] {
            stack.removeLast()
        }

        if !stack.isEmpty {
            result[i] = stack.last!
        }

        stack.append(numbers[i])
    }

    return result
}