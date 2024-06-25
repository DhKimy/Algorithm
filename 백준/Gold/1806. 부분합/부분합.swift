solution_1806()

func solution_1806() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, s) = (input[0], input[1])
    var arr = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr.insert(0, at: 0)
    var (left, right) = (0, 1)

    for i in 1..<arr.count {
        arr[i] += arr[i - 1]
    }

    var minLength = n + 2

    while right != arr.count {
        var sum = arr[right] - arr[left]

        if left == right {
            sum = arr[right] - arr[right - 1]
            right += 1
            minLength = min(minLength, right - left)
        } else {
            if sum >= s {
                minLength = min(minLength, right - left)
                left += 1
            } else {
                right += 1
            }
        }
    }
    print(minLength == n + 2 ? 0 : minLength)
}