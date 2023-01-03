import Foundation

func solution(_ s:String) -> Bool {
    var count = 0
    for i in s {
        if i == "(" {
            count += 1
        } else {
            count -= 1
            if count < 0 {
                return false
            }
        }
    }
    return count == 0 ? true : false
}