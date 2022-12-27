import Foundation

func solution(_ s:String, _ n:Int) -> String {
    let input = s
    var answer = [Character]()
    
    for i in input {
        var temp = i.isUppercase ? Int(i.asciiValue!) - 65 : i.isLowercase ? Int(i.asciiValue!) - 97 : -1
        if temp == -1 {
            answer.append(" ")
            continue
        }
        temp = temp + n > 25 ? (temp + n - 26) : temp + n
        if i.isUppercase {
            answer.append(Character(String((UnicodeScalar(temp + 65)!))))
        } else {
            answer.append(Character(String((UnicodeScalar(temp + 97)!))))
        }
    }
    return String(answer)
}