import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var innerLottos = lottos.sorted()
    var innerWinNums = win_nums.sorted()
    
    var unknownNumberCount = 0
    var currentMatched = 0
    for i in innerLottos {
        if i == 0 {
            unknownNumberCount += 1
            continue
        }
        if innerWinNums.contains(i) {
            currentMatched += 1
        }
    }
    var currentRank = 0
    switch currentMatched {
    case 6:
        currentRank = 1
    case 5:
        currentRank = 2
    case 4:
        currentRank = 3
    case 3:
        currentRank = 4
    case 2:
        currentRank = 5
    default:
        currentRank = 6
    }
    return [unknownNumberCount == 6 ? 1 : currentRank - unknownNumberCount, currentRank]
}