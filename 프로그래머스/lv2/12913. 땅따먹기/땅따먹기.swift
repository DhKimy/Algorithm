import Foundation

func solution(_ land:[[Int]]) -> Int {
    var landArray = land
    if landArray.count == 1 {
        return landArray[0].max()!
    }
    for i in 1 ... landArray.count - 1 {
        landArray[i][0] += max(landArray[i - 1][1], landArray[i - 1][2], landArray[i - 1][3])
        landArray[i][1] += max(landArray[i - 1][0], landArray[i - 1][2], landArray[i - 1][3])
        landArray[i][2] += max(landArray[i - 1][0], landArray[i - 1][1], landArray[i - 1][3])
        landArray[i][3] += max(landArray[i - 1][0], landArray[i - 1][1], landArray[i - 1][2])
    }
    return (landArray.last?.max()!)!
}