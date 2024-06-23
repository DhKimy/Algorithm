let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var (a, b, c) = (input[0], input[1], input[2])
let std = a

func pows(_ a: Int64, _ b: Int64, _ c : Int64) -> Int {
    if b == 1 {
        return Int(a % c)
    }

    var value = pows(a, b/2, Int64(c))
    value = value * value % Int(c)
    if b % 2 == 0 {
        return value
    }

    return Int(Int64(value) * a % c)
}

print(pows(Int64(a), Int64(b), Int64(c)))