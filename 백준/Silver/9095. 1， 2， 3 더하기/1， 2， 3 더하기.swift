let T = Int(readLine()!)!
var cases = [Int]()
var maxNum = 0

for _ in 0..<T {
    let num = Int(readLine()!)!
    cases.append(num)
    if num > maxNum {
        maxNum = num
    }
}

var dp = [Int](repeating: 0, count: maxNum + 1)

dp[0] = 1 // 0을 만드는 방법은 아무 수도 선택하지 않는 1가지 방법

if maxNum >= 1 {
    dp[1] = 1 // 1을 만드는 방법은 1 하나 선택하는 1가지 방법
}

if maxNum >= 2 {
    dp[2] = 2 // 2를 만드는 방법은 1+1, 2 두 가지 방법
}

for i in 3...maxNum {
    dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
}

for num in cases {
    print(dp[num])
}