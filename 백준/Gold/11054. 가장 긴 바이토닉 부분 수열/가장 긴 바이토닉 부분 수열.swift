func boj_11054() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let reverseArr = Array(arr.reversed())

    var plusArr = [1]
    var minusArr = [1]
    var result = 0

    for i in 1..<n {
        var tempPlusSum = 0
        var tempMinusSum = 0

        for j in 0..<i {
            if arr[j] < arr[i] {
                tempPlusSum = max(tempPlusSum, plusArr[j] + 1)
            }
        }

        for j in 0..<i {
            if reverseArr[j] < reverseArr[i] {
                tempMinusSum = max(tempMinusSum, minusArr[j] + 1)
            }
        }

        plusArr.append(tempPlusSum == 0 ? 1 : tempPlusSum)
        minusArr.append(tempMinusSum == 0 ? 1 : tempMinusSum)
    }
    minusArr = Array(minusArr.reversed())

    for i in 0..<n {
        result = max(result, minusArr[i] + plusArr[i] - 1)
    }

    print(result)
}

boj_11054()