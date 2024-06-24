let personNum = Int(readLine()!)!
let tShirts = readLine()!.split(separator: " ").compactMap { Int($0) }
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (t, p) = (input[0], input[1])

var tShirtsCount = 0

for i in tShirts {
    tShirtsCount += (i / t)
    if i % t > 0 { tShirtsCount += 1 }
}

print(tShirtsCount)
print(personNum / p, personNum % p)