func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var calculateInt: [Int] = []
    
    for i in 0 ... n - 1 {
        calculateInt.append(arr1[i] | arr2[i])
    }
    var answer: [String] = calculateInt.map({ String($0, radix: 2) })
    
    for i in 0 ... answer.count - 1 {
        var temp = [Character]()
        var tempCount = answer[i].count
        while tempCount != n {
            temp.append(" ")
            tempCount += 1
        }
        for j in answer[i] {
            temp.append(j == "1" ? "#" : " ")
        }
        answer[i] = String(temp)
    }
    return answer
}