import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    
    for i in 0 ... commands.count - 1 {
        var tempArray = [Int]()
        for j in commands[i][0] - 1 ... commands[i][1] - 1 {
            tempArray.append(array[j])
        }
        answer.append(tempArray.sorted()[commands[i][2] - 1])
    }
    return answer
}