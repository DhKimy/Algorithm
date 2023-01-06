func solution(_ arr:[Int]) -> Int {
    var tempLcm = 0
    for i in 0 ... arr.count - 1 {
        if i == 0 {
            tempLcm = lcm(arr[i], arr[i + 1])
        } else {
            tempLcm = lcm(arr[i], tempLcm)
        }
    }
    return tempLcm
}

func lcm(_ num1: Int, _ num2: Int) -> Int {
    return (num1 * num2) / gcd(num1, num2)
}

func gcd(_ num1: Int, _ num2: Int) -> Int {
    var divisor = 0
    if num1 > num2 {
        divisor = num1 % num2
        if divisor != 0 {
            return gcd(num2, divisor)
        } else {
            return num2
        }
    } else if num1 == num2 {
        return num1
    } else {
        divisor = num2 % num1
        if divisor != 0 {
            return gcd(num1, divisor)
        } else {
            return num1
        }
    }
}