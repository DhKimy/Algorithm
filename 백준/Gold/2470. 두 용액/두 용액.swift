let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var left = 0
var right = n - 1
var closestSum = Int.max
var answer = (0, 0)

while left < right {
    let sum = arr[left] + arr[right]

    if abs(sum) < abs(closestSum) {
        closestSum = sum
        answer = (arr[left], arr[right])
    }

    if sum < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print(answer.0, answer.1)