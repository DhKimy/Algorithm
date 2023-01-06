import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var appearWord = [String]()
    var loop = 0
    var person = 0
    for i in 0 ... words.count - 1 {
        person = i % n + 1
        loop = i / n + 1
        if i == words.count - 1 {
            if appearWord.contains(words[i]) {
                return [person, loop]
            }
            if words[i - 1].last != words[i].first {
                return [person, loop]
            }
            break
        }
        if words[i].last == words[i + 1].first {
            if appearWord.contains(words[i]) {
                return [person, loop]
            }
            appearWord.append(words[i])
        } else {
            if appearWord.contains(words[i]) {
                return [person, loop]
            }
            person = (i + 1) % n + 1
            loop = (i + 1) / n + 1
            return [person, loop]
        }
    }
    return [0, 0]
}
