import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportCount: Dictionary = [String : Set<String>]()
    var mailCount: Dictionary = [String : Int]()
    for i in id_list {
        reportCount[i] = Set<String>()
        mailCount[i] = 0
    }
    for j in report {
        reportCount[String(j.split(separator: " ")[1])]!.insert(String(j.split(separator: " ")[0]))
    }
    for (_, value) in reportCount {
        if value.count >= k {
            for j in value {
                mailCount[j]! += 1
            }
        }
    }
    var answer = [Int]()
    for i in id_list {
        answer.append(mailCount[i]!)
    }
    
    return answer
}