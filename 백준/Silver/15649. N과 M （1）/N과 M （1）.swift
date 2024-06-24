let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (input[0], input[1])
var arr = [Int](repeating: 0, count: m)
var isUsed = [Bool](repeating: false, count: n + 1)

func recurse(_ k: Int) {
    if k == m {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 1...n {
        if !isUsed[i] {
            arr[k] = i
            isUsed[i] = true
            recurse(k + 1)
            isUsed[i] = false
        }
    }
}

recurse(0)