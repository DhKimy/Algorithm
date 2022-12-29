import Foundation

func solution(_ s:String) -> [Int] {
    var answer = [Int]()
    var comeout = [Character]()
    var k = 0
    for i in s {
        if !(comeout.contains(i)) {
            answer.append(-1)
        } else {
            answer.append(k - comeout.lastIndex(of: i)!)
        }
        comeout.append(i)
        k += 1
    }
    return answer
}