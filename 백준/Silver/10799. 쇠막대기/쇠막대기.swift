let brackets = readLine()!.map { String($0) }
var stack: [String] = []
var answer = 0
var pastBracket = ""

for i in brackets {
    if i == ")" && pastBracket == "(" {
        if stack.count == 0 {

        } else if stack.count == 1 {
            stack.removeLast()
        } else {
            stack.removeLast()
            answer += stack.count
        }
        pastBracket = i
    } else if i == ")" && pastBracket == ")" {
        if stack.count > 0 {
            stack.removeLast()
            answer += 1
            pastBracket = i
        }
    } else {
        stack.append(i)
        pastBracket = i
    }
}
print(answer)