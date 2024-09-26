import Foundation

func solution(_ topping:[Int]) -> Int {
    let index = topping.count

    var answer = 0
    var toppingCntA = [Int: Int]()
    var toppingCntB = [Int: Int]()

    toppingCntA[topping[0]] = 1
    for (idx, i) in topping.enumerated() {
        if idx == 0 { continue }
        if let _ = toppingCntB[i] {
            toppingCntB[i]! += 1
        } else {
            toppingCntB[i] = 1
        }
    }

    for i in 0..<index - 1 {
        if i == 0 {
            if toppingCntA.count == toppingCntB.count {
                answer += 1
            }
            continue
        }

        if let _ = toppingCntA[topping[i]] {
            toppingCntA[topping[i]]! += 1
        } else {
            toppingCntA[topping[i]] = 1
        }

        if toppingCntB[topping[i]]! - 1 == 0 {
            toppingCntB[topping[i]] = nil
        } else {
            toppingCntB[topping[i]]! -= 1
        }

        if toppingCntA.count == toppingCntB.count {
            answer += 1
        }
    }

    return answer
}