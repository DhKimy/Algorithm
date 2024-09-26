import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }

    var queue: [(word: String, cnt: Int)] = [(begin, 0)]
    var visited = Set<String>()
    visited.insert(begin)

    while !queue.isEmpty {
        let current = queue.removeFirst()

        if current.word == target {
            return current.cnt
        }

        for word in words {
            if !visited.contains(word), canTransform(current.word, word) {
                queue.append((word, current.cnt + 1))
                visited.insert(word)
            }
        }
    }

    return 0
}


func canTransform(_ word1: String, _ word2: String) -> Bool {
    let word1Array = Array(word1)
    let word2Array = Array(word2)
    var diffCount = 0

    for i in 0..<word1Array.count {
        if word1Array[i] != word2Array[i] {
            diffCount += 1
        }

        if diffCount > 1 {
            return false
        }
    }

    return diffCount == 1
}