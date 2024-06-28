solution_17390()

func solution_17390() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    _ = input[0]
    let q = input[1]
    var arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
    var questions: [[Int]] = []

    for _ in 0..<q {
        questions.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    }

    for i in 1..<arr.count {
        arr[i] += arr[i - 1]
    }

    for i in 0..<questions.count {
        let left = questions[i][0] - 1
        let right = questions[i][1] - 1

        if left == 0 {
            print(arr[right])
        } else {
            print(arr[right] - arr[left - 1])
        }
    }
}