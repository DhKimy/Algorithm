import Foundation

func solution(_ s:String) -> [Int] {
    var loopCount = 0
    var zeroCount = 0
    var innerS = s
    while innerS != "1" {
        zeroCount += innerS.filter({ $0 == "0" }).count
        innerS = innerS.filter({ $0 == "1" })
        innerS = String(innerS.count, radix: 2)
        loopCount += 1
    }
    return [loopCount, zeroCount]
}