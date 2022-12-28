import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var emptyBottle = n
    var cokeCount = 0
    while emptyBottle >= a {
        if emptyBottle % a == 0 {
            cokeCount += (emptyBottle / a) * b
            emptyBottle = (emptyBottle / a) * b
        } else {
            cokeCount += (emptyBottle / a) * b
            emptyBottle = (emptyBottle / a) * b + (emptyBottle % a)
        }
    }
    return cokeCount
}