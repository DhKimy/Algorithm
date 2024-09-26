import Foundation

func solution(_ order:[Int]) -> Int {
        let lastCnt = order.count
    var stack = [Int]()
    var answer = 0

    var orderIdx = 0
    for i in 1...lastCnt {
        if i == order[orderIdx] {
            // 바로 트럭에 적재할 수 있는 경우
            answer += 1
            orderIdx += 1
        } else {
            // 적재할 수 없으면 스택에 저장
            stack.append(i)
        }

        // 스택에 저장된 상자들이 적재 순서에 맞는지 확인
        while !stack.isEmpty && stack.last! == order[orderIdx] {
            stack.removeLast()
            answer += 1
            orderIdx += 1
        }
    }

    return answer
}