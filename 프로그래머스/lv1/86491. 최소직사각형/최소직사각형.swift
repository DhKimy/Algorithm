import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var innerSizes = sizes
    for i in 0 ... innerSizes.count - 1 {
        if innerSizes[i][0] < innerSizes[i][1] {
            var temp = innerSizes[i][0]
            innerSizes[i][0] = innerSizes[i][1]
            innerSizes[i][1] = temp
        }
    }
    var maxX = 0
    var maxY = 0
    for i in innerSizes {
        if maxX < i[0] {
            maxX = i[0]
        }
        if maxY < i[1] {
            maxY = i[1]
        }
    }
    return maxX * maxY
}