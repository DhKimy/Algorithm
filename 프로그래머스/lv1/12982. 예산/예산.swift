import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var money = budget
    var array = d.sorted()
    for i in 0 ... array.count - 1 {
        if money - array[i] < 0 {
            break
        }
        money -= array[i]
        array[i] = 0
        
    }
    return array.filter({ $0 == 0 }).count
}