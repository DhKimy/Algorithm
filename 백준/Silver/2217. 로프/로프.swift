solution_2217()

func solution_2217() {
    let n = Int(readLine()!)!
    var arr = [Int]()
    for _ in 1...n {
        arr.append(Int(readLine()!)!)
    }
    arr.sort(by: >)

    var maxWeight = arr[0]
    var weightMemo = [Double(arr[0])]

    for i in 1..<arr.count {
        let weightAvr = (Double(weightMemo.last!) + Double(arr[i])) / Double(i + 1)

        if Double(arr[i]) < weightAvr {
            maxWeight = max(maxWeight, arr[i] * (i + 1))
        }
        weightMemo.append(Double(weightMemo[i - 1] + Double(arr[i])))
    }

    print(maxWeight)
}