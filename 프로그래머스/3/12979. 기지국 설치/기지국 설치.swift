import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{

    var answer = 0
    var start = 1

    for station in stations {
        let left = station - w
        let right = station + w

        if left > start {
            let uncoveredLength = left - start
            answer += (uncoveredLength + (2 * w)) / (2 * w + 1)
        }

        start = right + 1
    }

    if start <= n {
        let uncoveredLength = n - start + 1
        answer += (uncoveredLength + (2 * w)) / (2 * w + 1)
    }

    return answer

}