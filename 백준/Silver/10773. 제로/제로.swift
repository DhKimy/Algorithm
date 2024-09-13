func boj_10773() {
    let k = Int(readLine()!)!
    var nums = [Int]()

    for _ in 0..<k {
        let input = Int(readLine()!)!
        if !nums.isEmpty && input == 0 {
            nums.removeLast()
        } else {
            nums.append(input)
        }
    }

    print(nums.reduce(0, +))
}

boj_10773()