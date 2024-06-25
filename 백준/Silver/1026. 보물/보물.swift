solution_1026()

func solution_1026() {
    let n = Int(readLine()!)!
    let A = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted(by: <)
    let B = readLine()!.split(separator: " ").compactMap { Int($0) }
    var newA = [Int](repeating: 0, count: n)
    var newB = B
    var answer = 0

    for i in A {
        let currentMax = newB.max()!
        let firstIndex = newB.firstIndex(of: currentMax)!
        newB[firstIndex] = -1
        newA[firstIndex] = i
    }

    for i in 0..<n {
        answer += newA[i] * B[i]
    }

    print(answer)
}
