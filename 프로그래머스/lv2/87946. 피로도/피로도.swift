import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var answer: Int = 0
    explore(dungeons, &answer, k, 0)
    return answer
}

func explore(_ dungeons:[[Int]], _ answer: inout Int, _ k:Int, _ count:Int) {
    answer = max(answer, count)
    for (i, dungeon) in dungeons.enumerated() {
        var newDungeons: [[Int]] = dungeons
        if dungeon[0] <= k && dungeon[1] <= k {
            let newK = k - dungeon[1]
            newDungeons.remove(at: i)
            explore(newDungeons, &answer, newK, count + 1)
        }
    }
}