import Foundation

func solution(_ s:String) -> Int {
    var innerS = s
    let dict: [String: String] = ["zero" : "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    
    for (key, value) in dict {
        innerS = innerS.replacingOccurrences(of: key, with: value)
    }
    return Int(innerS)!
}