let brackets = readLine()!.map { String($0) }
var stack: [String] = []
var temp = 1
var answer = 0
var isValid = true

for (index, i) in brackets.enumerated() {
    switch i {
        case "(":
        stack.append(i)
        temp *= 2
        case "[":
        stack.append(i)
        temp *= 3
        case ")":
        if stack.isEmpty || stack.last! != "(" {
            isValid = false
            break
        } else {
            if brackets[index - 1] == "(" {
                answer += temp
            }
            stack.removeLast()
            temp /= 2
        }
        default:
        if stack.isEmpty || stack.last! != "[" {
            isValid = false
            break
        } else {
            if brackets[index - 1] == "[" {
                answer += temp
            }
            stack.removeLast()
            temp /= 3
        }

    }

}

if !isValid || !stack.isEmpty {
    print(0)
} else {
    print(answer)
}