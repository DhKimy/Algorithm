import Foundation

func solution(_ food:[Int]) -> String {
    var result = [String]()
    
    var leftSideArray = [Character]()
    for i in 1 ... food.count - 1 {
        if food[i] == 1 {
            continue
        }
        for _ in 1 ... food[i] / 2 {
            leftSideArray.append(Character(String(i)))
        }
    }
    result.append(String(leftSideArray))
    result.append(String("0"))
    result.append(String(leftSideArray.reversed()))
    
    return result.joined(separator: "")
}
