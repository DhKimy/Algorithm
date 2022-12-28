import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var answer = 0
    let tArray = Array(t)
    let pArray = Array(p)
    
    var k = 0
    for i in 0 ... t.count - p.count {
        for j in i ... i + p.count - 1 {
            if tArray[j] > pArray[k] {
                break
            } else if tArray[j] < pArray[k] {
                answer += 1
                break
            }
            if j == i + p.count - 1 && tArray[j] == pArray[k] {
                answer += 1
                break
            }
            k += 1
        }
        k = 0
    }
    return answer
}