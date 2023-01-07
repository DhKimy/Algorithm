import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var surveyDictionary: [Character : Int] = ["R" : 0, "T" : 0, "F" : 0, "C" : 0, "M" : 0, "J" : 0, "A" : 0, "N" : 0]
    for (index, i) in choices.enumerated() {
        if i == 4 {
            continue
        } else if i < 4 {
            let score = 4 - i
            surveyDictionary[Array(survey[index])[0]]! += score
        } else {
            let score = i - 4
            surveyDictionary[Array(survey[index])[1]]! += score
        }
    }
    
    var answer = [Character]()
    surveyDictionary["R"]! >= surveyDictionary["T"]! ? answer.append("R") : answer.append("T")
    surveyDictionary["C"]! >= surveyDictionary["F"]! ? answer.append("C") : answer.append("F")
    surveyDictionary["J"]! >= surveyDictionary["M"]! ? answer.append("J") : answer.append("M")
    surveyDictionary["A"]! >= surveyDictionary["N"]! ? answer.append("A") : answer.append("N")
    
    return String(answer)
}