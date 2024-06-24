var arr = [String]()
for _ in 0...2 {
    arr.append(readLine()!)
}
var index = 0
var number = 0

for (idx, i) in arr.enumerated() {
    if let num = Int(i) {
        index = idx
        number = num
    }
}

if index == 0 {
    number += 3
} else if index == 1 {
    number += 2
} else {
    number += 1
}

if number % 15 == 0 {
    print("FizzBuzz")
} else if number % 5 == 0 {
    print("Buzz")
} else if number % 3 == 0 {
    print("Fizz")
} else {
    print(number)
}