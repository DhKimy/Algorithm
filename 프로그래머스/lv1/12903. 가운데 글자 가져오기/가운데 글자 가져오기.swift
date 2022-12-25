func solution(_ s:String) -> String {
    if s.count % 2 != 0 {
        return String(Array(s)[(s.count - 1) / 2])
    } else {
        var answer = [Character]()
        for i in s.count / 2 - 1 ... s.count / 2 {
            answer.append(Array(s)[i])
        }
        return String(answer)
    }
}