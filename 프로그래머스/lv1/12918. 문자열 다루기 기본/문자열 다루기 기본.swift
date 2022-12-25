func solution(_ s:String) -> Bool {
    
    for i in Array(s) {
        if !(i.isNumber) {
            return false
        }
    }
    if s.count == 4 || s.count == 6 {
        return true
    }
    return false
}