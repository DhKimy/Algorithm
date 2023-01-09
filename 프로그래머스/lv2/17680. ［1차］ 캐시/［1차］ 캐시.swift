func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var stack = [String]()
    var answer = 0
    if cacheSize == 0 {
        return cities.count * 5
    }
    for i in cities {
        if stack.contains(i.lowercased()) {
            answer += 1
            stack.remove(at: stack.firstIndex(of: i.lowercased())!)
            stack.append(i.lowercased())
        } else {
            answer += 5
            if stack.count < cacheSize {
                stack.append(i.lowercased())
            } else {
                stack.removeFirst()
                stack.append(i.lowercased())
            }
        }
    }
    return answer
}