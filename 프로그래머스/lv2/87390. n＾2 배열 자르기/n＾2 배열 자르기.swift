import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var array = [Int]()
    var line = left / Int64(n)
    var row = left % Int64(n)
    
    var k: Int64 = {
        if line < row {
            return row + 1
        } else {
            return line + 1
        }
    }()
    while array.count != right - left + 1 {
        array.append(Int(k))
        if line <= row {
            k += 1
        }
        row += 1
        if row == n {
            row = 0
            line += 1
            k = line + 1
        }
    }
    return array
}