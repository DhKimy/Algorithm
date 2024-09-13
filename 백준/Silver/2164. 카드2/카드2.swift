func boj_2164() {
    let n = Int(readLine()!)!
    var arr = Array(1...n)
    var head = 0

    while head < arr.count - 1 {
        head += 1  // 첫 번째 카드를 버림
        arr.append(arr[head])  // 두 번째 카드를 뒤로 이동
        head += 1  // 두 번째 카드도 제거
    }

    print(arr[head])
}

boj_2164()