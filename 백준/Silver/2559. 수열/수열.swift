let nums1 = readLine()!.split(separator: " ").map { Int($0)! }
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let n = nums1[0]
    let k = nums1[1]
    var left = 0
    var right = k - 1
    var maxSum = 0
    var preSum = 0

    while right != n {
        if left == 0 {
            preSum = nums[left...right].reduce(0, +)
                maxSum = preSum
        } else {
            preSum = preSum - nums[left - 1] + nums[right]
        }
        maxSum = max(maxSum, preSum)

            left += 1
            right += 1
    }

print(maxSum)