func solution(_ s:String) -> String {
    var lowerArray = [Character]()
    var upperArray = [Character]()
    for i in Array(s) {
        if i.isLowercase {
            lowerArray.append(i)
        } else {
            upperArray.append(i)
        }
    }
    let answer = [String(lowerArray.sorted(by: >)), String(upperArray.sorted(by: >))]
    return answer.joined()
}