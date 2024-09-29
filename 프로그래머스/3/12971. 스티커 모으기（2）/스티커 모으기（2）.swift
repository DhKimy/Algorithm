import Foundation

func solution(_ sticker:[Int]) -> Int{
    let n = sticker.count
    if n <= 2 {
        if n == 1 {
            return sticker[0]
        } else {
            return max(sticker[0], sticker[1])
        }
    }
    
    var dp1 = [Int](repeating: 0, count: n)
    var dp2 = [Int](repeating: 0, count: n)
    
    // 첫번째 스티커를 떼는 경우
    dp1[0] = sticker[0]
    dp1[1] = max(sticker[0], sticker[1])
    for i in 2..<n - 1 {
        dp1[i] = max(dp1[i - 1], dp1[i - 2] + sticker[i])
    }
    
    // 첫번째 스티커를 떼지 않는 경우
    dp2[1] = sticker[1]
    for i in 2..<n {
        dp2[i] = max(dp2[i - 1], dp2[i - 2] + sticker[i])
    }

    return max(dp1[n - 2], dp2[n - 1])
}