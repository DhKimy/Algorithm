import Foundation

func solution(_ gems:[String]) -> [Int] {
    let gemTypesCount = Set(gems).count
    var gemDict = [String: Int]()
    var answer = [0, gems.count - 1]
    var head = 0                         
    var tail = 0                         
    var uniqueGemsCount = 0 // 현재 구간에서 고유 보석 개수
    
    while tail < gems.count {
        // tail을 늘리며 보석 추가
        gemDict[gems[tail], default: 0] += 1
        
        if gemDict[gems[tail]] == 1 {  // 새로운 보석이 추가되면 고유 보석 카운트 증가
            uniqueGemsCount += 1
        }

        // 모든 보석을 포함하는 구간을 찾으면 head를 움직여 최소 구간 찾기 시도
        while uniqueGemsCount == gemTypesCount {
            // 최소 구간이면 갱신
            if tail - head < answer[1] - answer[0] {
                answer = [head, tail]
            }
            
            // head를 늘려서 구간을 좁히기
            gemDict[gems[head]]! -= 1
            if gemDict[gems[head]] == 0 {  // 보석이 완전히 없어지면 고유 보석 카운트 감소
                uniqueGemsCount -= 1
            }
            head += 1
        }
        
        tail += 1
    }
    
    return [answer[0] + 1, answer[1] + 1]
}