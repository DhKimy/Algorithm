solution_5430()

func solution_5430() {
    let t = Int(readLine()!)!
    var p: [String] = []
    var n = 0
    var arr: [Int] = []
    var answer = [String]()
    var left = 0
    var right = 0
    var flag = true // true 정방향, false 역방향

    for _ in 1...t {
        // 입력
        p = readLine()!.map { String($0) }
        n = Int(readLine()!)!
        let arrString = readLine()!.dropFirst().dropLast()
        arr = arrString.split(separator: ",").compactMap { Int($0) }
        left = 0
        right = n
        flag = true

        for i in p {
            if i == "R" {
                flag.toggle()
                continue
            }

            if flag {
                left += 1
            } else {
                right -= 1
            }

            if left > right { break }
        }

        if left > right {
            print("error")
        } else {
            if flag {
                print("[\(arr[left..<right].map { String($0) }.joined(separator: ","))]")
            } else {
                print("[\(arr[left..<right].reversed().map { String($0) }.joined(separator: ","))]")
            }
        }
    }
}