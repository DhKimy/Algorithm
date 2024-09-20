func boj_11728() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let arrA = readLine()!.split(separator: " ").map { Int($0)! }
    let arrB = readLine()!.split(separator: " ").map { Int($0)! }

    var idxA = 0
    var idxB = 0
    var result = ""

    for _ in 0..<input[0] + input[1] {
        if idxA == input[0] {
            result += "\(arrB[idxB]) "
            idxB += 1
            continue
        }

        if idxB == input[1] {
            result += "\(arrA[idxA]) "
            idxA += 1
            continue
        }

        if arrA[idxA] < arrB[idxB] {
            result += "\(arrA[idxA]) "
            idxA += 1
        } else {
            result += "\(arrB[idxB]) "
            idxB += 1
        }
    }

    print(result)
}

boj_11728()