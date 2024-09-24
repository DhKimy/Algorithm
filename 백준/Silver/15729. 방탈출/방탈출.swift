func boj_15729() {
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int($0)! == 1 ? true : false }
    var cnt = 0

    for i in 0..<n {
        if i < n - 2 {
            if arr[i] == true {
                arr[i].toggle()
                arr[i + 1].toggle()
                arr[i + 2].toggle()
                cnt += 1
            }
        } else if i < n - 1 {
            if arr[i] == true {
                arr[i].toggle()
                arr[i + 1].toggle()
                cnt += 1
            }
        } else {
            if arr[i] == true {
                arr[i].toggle()
                cnt += 1
            }
        }
    }

    print(cnt)
}

boj_15729()