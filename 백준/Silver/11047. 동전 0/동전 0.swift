solution_11047()

func solution_11047() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    var (n, k) = (input[0], input[1])
    var coins = [Int]()
    var count = 0
    for _ in 1...n {
        coins.append(Int(readLine()!)!)
    }
    coins.sort(by: >)

    var idx = 0
    while k != 0 {

        if k / coins[idx] == 0 {
            idx += 1
            continue
        } else {
            count += k / coins[idx]
            k %= coins[idx]
        }
    }

    print(count)
}