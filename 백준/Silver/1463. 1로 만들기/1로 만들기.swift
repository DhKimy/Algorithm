let n = Int(readLine()!)!
var visited = [Int](repeating: 1000000000, count: n + 1)
var count = 1000000000

func divLogic(_ num: Int, _ cnt: Int) {
    if num == 1 {
        count = min(count, cnt)
        return
    }

    if num % 3 == 0 && cnt < visited[num / 3] {
        divLogic(num / 3, cnt + 1)
        visited[num / 3] = cnt
    }

    if num % 2 == 0 && cnt < visited[num / 2] {
        divLogic(num / 2, cnt + 1)
        visited[num / 2] = cnt
    }

    if cnt < visited[num - 1] {
        divLogic(num - 1, cnt + 1)
        visited[num - 1] = cnt
    }
}

divLogic(n, 0)
print(count)