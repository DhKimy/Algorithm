import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    func checkAllSame(_ length: Int, _ startX: Int, _ startY: Int) {
        if length == 1 {
            return
        }

        var sameNum = -1
        var flag = false

        for y in startY..<startY + length {
            for x in startX..<startX + length {
                if sameNum == -1 {
                    sameNum = qud[y][x]!
                    continue
                }

                if qud[y][x]! != sameNum {
                    flag = true
                    break
                }
            }
            if flag {
                break
            }
        }

        if flag {
            checkAllSame(length / 2, startX, startY)
            checkAllSame(length / 2, startX + length / 2, startY)
            checkAllSame(length / 2, startX + length / 2, startY + length / 2)
            checkAllSame(length / 2, startX, startY + length / 2)
        } else {
            for y in startY..<startY + length {
                for x in startX..<startX + length {
                    if x == startX && y == startY {
                        continue
                    } else {
                        qud[y][x] = nil
                    }
                }
            }
        }
    }

    var length = arr.count
    var qud: [[Int?]] = arr
    var answer = [0, 0]
    
    checkAllSame(length, 0, 0)

    for i in qud.compactMap({ $0.compactMap { $0 } }) {
        for j in i {
            if j == 0 {
                answer[0] += 1
            } else {
                answer[1] += 1
            }
        }
    }

    return answer
}