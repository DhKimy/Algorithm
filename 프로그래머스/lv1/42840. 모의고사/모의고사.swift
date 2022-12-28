import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let aStudentAnswer = [1, 2, 3, 4, 5]
    let bStudentAnswer = [2, 1, 2, 3, 2, 4, 2, 5]
    let cStudentAnswer = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    let array = [[1, calculateScore(answers, aStudentAnswer)], [2, calculateScore(answers, bStudentAnswer)], [3, calculateScore(answers, cStudentAnswer)]].sorted(by: { $0[1] > $1[1] })
    
    var answer = [Int]()
    if array[0][1] == array[1][1] {
        if array[1][1] == array[2][1] {
           for i in array {
                answer.append(i[0])
            }
            return answer
        } else {
            return [array[0][0], array[1][0]]
        }
        
    } else {
        return [array[0][0]]
    }
}

func calculateScore(_ answer: [Int], _ student: [Int]) -> Int{
    var sum = 0
    var j = 0
    for i in 0 ... answer.count - 1 {
        if answer[i] == student[j] {
            sum += 1
        }
        j += 1
        if j == student.count {
            j = 0
        }
    }
    return sum
}