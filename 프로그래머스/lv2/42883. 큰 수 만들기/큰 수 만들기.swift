import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var numbers = Array(number)
    var stack = [Character]()
    var count = 0
    var i = 0
    while count < k && i < numbers.count {
        guard let last = stack.last else {
            stack.append(numbers[i])
            i += 1
            continue
        }
        
        if last < numbers[i] {
            stack.removeLast()
            count += 1
            continue
        }
        
        stack.append(numbers[i])
        i += 1
    }
    
    if count >= k {
        stack.append(contentsOf: numbers[i...])
    }
    if i >= numbers.count {
        return stack[0..<numbers.count - k].reduce(""){"\($0)\($1)"}
    }
    return stack.reduce(""){"\($0)\($1)"}
}