import Foundation

func solution(_ s:String) -> Int {
    var answer = [String]()
    var count1 = 0
    var count2 = 0
    
    var innerS = Array(s)
    
    var tempFirst: Character = " "
    var tempArray = [Character]()
    for i in 0 ... innerS.count - 1 {
        if i == innerS.count - 1 {
            tempArray.append(innerS[i])
            answer.append(String(tempArray))
            break
        }
        if count1 == 0 && count2 == 0 {
            tempFirst = innerS[i]
            count1 += 1
            tempArray.append(innerS[i])
            continue
        }
        if innerS[i] != tempFirst {
            count2 += 1
            tempArray.append(innerS[i])
        } else {
            count1 += 1
            tempArray.append(innerS[i])
        }
        
        if count1 == count2 {
            answer.append(String(tempArray))
            count1 = 0
            count2 = 0
            tempArray = [Character]()
        }
    }
    return answer.count
}