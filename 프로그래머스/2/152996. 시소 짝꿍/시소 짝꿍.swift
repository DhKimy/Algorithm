import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var dict = [Int: Int]()
    var answer: Int64 = 0

    for i in weights {
        if let _ = dict[i] {
            dict[i]! += 1
        } else {
            dict[i] = 1
        }
    }

    let dictArr = Array(dict.keys)

    for (idx, i) in dictArr.enumerated() {
        let currentCnt = dict[i]!
        if currentCnt != 1 {
            answer += Int64((currentCnt * (currentCnt - 1)) / 2)
        }

        for j in idx + 1..<dictArr.count {
            let varNum = dictArr[j]
            let varCnt = dict[varNum]!

            if i == varNum * 2 || i * 2 == varNum
            || i * 3 == varNum * 2 || i * 2 == varNum * 3
            || i * 3 == varNum * 4 || i * 4 == varNum * 3 {
                answer += Int64(currentCnt * varCnt)
            }
        }
    }
    return answer
}