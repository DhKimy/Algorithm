func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var answer = n - lost.count
    var innerLost = lost.sorted()
    var innerReserve = reserve.sorted()
    var reservedStudent = 0
    
    for i in innerLost {
        if innerReserve.contains(i) {
            innerLost.remove(at: innerLost.firstIndex(of: i)!)
            innerReserve.remove(at: innerReserve.firstIndex(of: i)!)
            answer += 1
        }
    }
    
    for i in innerLost {
        var k = 0
        for j in innerReserve {
            if i + 1 == j || i - 1 == j {
                reservedStudent += 1
                innerReserve.remove(at: k)
                break
            }
            k += 1
        }
    }
    return answer + reservedStudent
}