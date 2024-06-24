let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (input[0], input[1])
var nums = [Int]()
var left = 0
var right = 0
var answer = -1

for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}

nums.sort(by: <)

while right < n {
    let dif = nums[right] - nums[left]

    if dif < m {
        right += 1
    } else if dif == m{
        answer = dif
        break
    } else {
        left += 1
        if answer < m {
            answer = dif
        } else {
            answer = min(answer, dif)
        }
    }
}

print(answer)