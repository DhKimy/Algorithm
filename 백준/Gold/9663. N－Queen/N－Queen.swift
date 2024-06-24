solution_9663_backtracking()

func solution_9663_backtracking() {
    let n = Int(readLine()!)!
    var count = 0
    var columns = [Bool](repeating: false, count: n)
    var diagonal1 = [Bool](repeating: false, count: 2 * n - 1)
    var diagonal2 = [Bool](repeating: false, count: 2 * n - 1)

    func search(_ posY: Int) {
        if posY == n {
            count += 1
            return
        }

        for posX in 0..<n {
            if !columns[posX] && !diagonal1[posX + posY] && !diagonal2[posX - posY + n - 1] {
                columns[posX] = true
                diagonal1[posX + posY] = true
                diagonal2[posX - posY + n - 1] = true
                search(posY + 1)
                columns[posX] = false
                diagonal1[posX + posY] = false
                diagonal2[posX - posY + n - 1] = false
            }
        }
    }

    search(0)
    print(count)
}