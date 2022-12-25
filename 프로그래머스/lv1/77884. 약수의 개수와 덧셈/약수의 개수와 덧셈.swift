import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var sum = 0
    for i in left ... right {
        if (1 ... i).filter({ i % $0 == 0 }).count % 2 == 0 {
            sum += i
        } else {
            sum -= i
        }
    }
    return sum
}