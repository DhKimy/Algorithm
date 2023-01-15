import Foundation

func solution(_ s:String) -> [Int] {
    var answer = [Int]()
    var tuple = [[Int]]()
    var tempArray = [Int]()
    var tempString: String = ""
    for (index, i) in s.enumerated() {
        if i == "," {
            tempArray.append(Int(tempString)!)
            tempString = ""
        } else if i.isNumber {
            tempString += String(i)
        } else if i == "{" {
            if !(tempArray.isEmpty) {
                tuple.append(tempArray)
                tempArray = [Int]()
            }
        } else {
            if index == s.count - 2 {
                tempArray.append(Int(tempString)!)
                tempString = ""
            } else if index == s.count - 1{
                tuple.append(tempArray)
            }
        }
    }
    
    tuple.sort(by: { $0.count < $1.count })
    for i in 0 ... tuple.count - 1 {
        let temp1 = Set(answer)
        let temp2 = Set(tuple[i])
        let resultNumberSet: [Int] = Array(temp2.subtracting(temp1))
        answer.append(resultNumberSet[0])
    }
    return answer
}