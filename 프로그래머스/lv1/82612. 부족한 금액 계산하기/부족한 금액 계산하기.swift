import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let answer = money - (1 ... count).map({ $0 * price }).reduce(0, +)
    return Int64(answer < 0 ? abs(answer) : 0)
}