func solution(_ s:String) -> String {
    var array = s.components(separatedBy: " ").map({ $0.lowercased() })
    var j = 0
    for i in array {
        if i.first?.isLetter != nil {
            var temp = Array(i)
            temp[0] = Character(String(temp[0]).uppercased())
            array[j] = String(temp)
        }
        j += 1
    }
    return array.joined(separator: " ")
}