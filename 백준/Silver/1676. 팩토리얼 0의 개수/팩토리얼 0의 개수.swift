solution_1676()

func solution_1676() {
    let n = Int(readLine()!)!
    var twoCount = 0
    var fiveCount = 0

    if n == 0 {
        print(0)
        return
    }

    for i in 1...n {
        var std1 = i
        var count = 0
        while std1 % 2 == 0 {
            std1 /= 2
            count += 1
        }
        twoCount += count
    }

    for i in 1...n {
        var std2 = i
        var count = 0
        while std2 % 5 == 0 {
            std2 /= 5
            count += 1
        }
        fiveCount += count
    }

    print(min(twoCount, fiveCount))
}