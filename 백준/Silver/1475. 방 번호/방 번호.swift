func boj_1475() {
    let n = readLine()!.map { Int(String($0))! }
    var nums = [Int](repeating: 0, count: 10)

    for i in n {
        nums[i] += 1
    }

    nums[9] += nums[6]
    nums[6] = 0

    if nums[9] % 2 != 0 {
        nums[9] /= 2
        nums[9] += 1
    } else {
        nums[9] /= 2
    }

    print(nums.max()!)
}

boj_1475()