import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    let skill = Array(skill)
    for i in skill_trees {
        var stack = [Character]()
        for j in i {
            if skill.contains(j) {
                stack.append(j)
            }
        }
        
        if stack.count == 0 {
            answer += 1
            continue
        }
        
        for (index, j) in stack.enumerated() {
            if skill[index] != j {
                break
            }
            if index == stack.count - 1 {
                answer += 1
            }
        }
    }
    return answer
}