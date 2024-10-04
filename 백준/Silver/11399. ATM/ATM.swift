let n = Int(readLine()!)!
let time = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var total = 0
var currentSum = 0

for t in time {
    currentSum += t
    total += currentSum
}

print(total)